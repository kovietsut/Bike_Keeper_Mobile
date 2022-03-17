import 'dart:io';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:mobile/global/global_variable.dart';
import 'package:intl/intl.dart';

import 'package:mobile/blocs/transaction_bloc/bloc.dart';
import 'package:mobile/helpers/firebase_helper.dart';
import 'package:mobile/global/theme.dart';
import 'package:mobile/widgets/base/base_ontap_widget.dart';
import 'package:mobile/widgets/base/gradient_background.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/widgets/loading_dialog.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaptureImagePage extends StatefulWidget {
  final CameraDescription camera;

  const CaptureImagePage({
    Key? key,
    required this.camera,
  }) : super(key: key);

  @override
  _CaptureImagePageState createState() => _CaptureImagePageState();
}

class _CaptureImagePageState extends State<CaptureImagePage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.max);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(children: <Widget>[
            SizedBox(
              child: CustomAppBar(
                text: "Capture License Plate",
                textColor: ABSOLUTE_WHITE,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              height: size.height * 0.07,
            ),
            SizedBox(
              height: size.height * 0.93,
              child: FutureBuilder(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (_controller.value.isInitialized) {
                      return CameraPreview(_controller);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ]),
          Positioned(
            bottom: 30,
            left: (size.width - 80) / 2,
            child: BaseOnTapWidget(
              child: GradientBackground(
                borderRadius: BorderRadius.circular(1000),
                colors: const [PRIME_WHITE, PRIME_WHITE],
                padding: const EdgeInsets.all(20),
                child: const Icon(
                  Icons.camera_alt,
                  size: 40,
                  color: PRIME_COLOR,
                ),
              ),
              onTap: () async {
                await _initializeControllerFuture;
                LoadingDialog.showLoadingDialog(context, text: "loading");
                final image = await _controller.takePicture();

                final visionImage = InputImage.fromFilePath(image.path);

                const _hasPattern = true;
                // final ImageLabeler labeler =
                //     FirebaseVision.instance.imageLabeler();
                // final List<ImageLabel> labels =
                //     await labeler.processImage(visionImage);
                // bool _hasPattern = false;
                // labels.forEach((element) {
                //   print("detected object: " +
                //       element.text +
                //       " " +
                //       element.confidence.toString());
                //   if (element.text == "Pattern" && element.confidence > 0.5)
                //     _hasPattern = true;
                // });
                if (_hasPattern) {
                  String text;
                  try {
                    final textDetector = GoogleMlKit.vision.textDetector();

                    final RecognisedText visionText =
                        await textDetector.processImage(visionImage);
                    text = visionText.text.replaceAll("\n", " ");
                    final regexp = RegExp(
                        "([0-9]{2}[A-Z][- ]{1}[0-9]{3}[.]{0,1}[0-9]{2})|([0-9]{2}-{0,1}[A-Z][0-9A-Z] {0,1}[0-9]{3}.{0,1}[0-9]{1,2})");
                    RegExpMatch? index = regexp.allMatches(text).first;
                    final String? result =
                        text.substring(index.start, index.end);
                    if (result != null) {
                      String name = DateFormat("yyyyMMdd-hhmmss.jpg")
                          .format(DateTime.now());
                      BlocProvider.of<TransactionBloc>(context).add(
                          TransactionLicensePlateFetch(
                              licensePlate: result,
                              imageLicensePlate: FIREBASE_PATH + "/" + name));
                      FirebaseHelper.initStorageInstance();
                      await FirebaseHelper.pushFile(image.path, name);
                      File(image.path).delete();

                      LoadingDialog.hideLoadingDialog(context);
                      LoadingDialog.showNotifyDialog(context,
                          text: "License plate detected: \n" + result);
                    } else {
                      LoadingDialog.hideLoadingDialog(context);
                      LoadingDialog.showNotifyDialog(context,
                          text: "License Plate not found");
                    }
                  } on Exception {
                    LoadingDialog.hideLoadingDialog(context);
                    LoadingDialog.showNotifyDialog(context,
                        text: "License Plate not found");
                  }
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
