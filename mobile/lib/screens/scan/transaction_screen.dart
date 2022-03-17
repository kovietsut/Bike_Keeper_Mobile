import 'package:mobile/blocs/transaction_bloc/bloc.dart';
import 'package:mobile/models/qualified_model.dart';
import 'package:mobile/screens/scan/capture_image_screen.dart';
import 'package:mobile/screens/scan/qr_scan_screen.dart';
import 'package:mobile/global/theme.dart';
import 'package:mobile/widgets/base/base_ontap_widget.dart';
import 'package:mobile/widgets/base/gradient_background.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:mobile/widgets/light_shadow_container.dart';
import 'package:mobile/widgets/loading_dialog.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            SizedBox(
              child: CustomAppBar(
                text: "Create Transaction",
                textColor: ABSOLUTE_WHITE,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              height: size.height * 0.07,
            ),
            SizedBox(
                height: size.height * 0.93,
                child: const TransactionScreenContent()),
          ],
        ));
  }
}

class TransactionScreenContent extends StatefulWidget {
  const TransactionScreenContent({Key? key}) : super(key: key);

  @override
  _TransactionScreenContentState createState() =>
      _TransactionScreenContentState();
}

class _TransactionScreenContentState extends State<TransactionScreenContent> {
  QualifiedModel? _qualifiedModel;

  @override
  void dispose() {
    _qualifiedModel = null;
    super.dispose();
  }

  Widget _transactionScreenRow(String title, String txt, VoidCallback? tap) {
    return Container(
      padding: const EdgeInsets.only(
          left: MAIN_LAYOUT_PADDING,
          right: MAIN_LAYOUT_PADDING,
          top: MAIN_LAYOUT_PADDING / 4,
          bottom: MAIN_LAYOUT_PADDING / 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 6, horizontal: MAIN_LAYOUT_PADDING),
            child: Text(
              title,
              style: const TextStyle(
                  color: PRIME_GRAY, fontWeight: FontWeight.w600),
            ),
          ),
          LightShadowContainer(
            // margin: EdgeInsets.symmetric(
            //     horizontal: MAIN_LAYOUT_PADDING,
            //     vertical: MAIN_LAYOUT_PADDING / 2),
            child: BaseOnTapWidget(
              child: TextField(
                onTap: tap,
                decoration: const InputDecoration(border: InputBorder.none),
                readOnly: true,
                controller: TextEditingController()..text = txt,
                onChanged: (text) => {},
                textAlign: TextAlign.center,
              ),
              onTap: tap,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _qualifiedModel = QualifiedModel("", "", "", "", "", "", "");
    // var color = [PRIME_BLUE, ASCENT_BLUE];
    return BlocConsumer<TransactionBloc, TransactionState>(
        bloc: BlocProvider.of<TransactionBloc>(context),
        listener: (context, state) {
          if (state is TransactionQRFetched) {
            _qualifiedModel?.qRCode = state.qRCode;
            _qualifiedModel?.vehicleColor = state.vehicleColor;
            _qualifiedModel?.vehicleManufacturer = state.vehicleManufacturer;
            _qualifiedModel?.transactionType = state.transactionType;
          }
          if (state is TransactionLicensePlateFetched) {
            _qualifiedModel?.licensePlate = state.licensePlate;
            _qualifiedModel?.url = state.imageLicensePlate;
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              _transactionScreenRow(
                  "QR Code", (_qualifiedModel?.qRCode ?? "").toUpperCase(), () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const ScanQRScreen()));
              }),
              _transactionScreenRow("License Plate Code",
                  (_qualifiedModel?.licensePlate ?? "").toUpperCase(), () {
                _getCamera().then((value) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => CaptureImagePage(
                        camera: value,
                      ),
                    ),
                  );
                });
              }),
              _transactionScreenRow("Color",
                  (_qualifiedModel?.vehicleColor ?? "").toUpperCase(), () {}),
              _transactionScreenRow(
                  "Manufacturer",
                  (_qualifiedModel?.vehicleManufacturer ?? "").toUpperCase(),
                  () {}),
              BaseOnTapWidget(
                onTap: () {
                  LoadingDialog.showLoadingDialog(context,
                      text: "Submitting...");
                  try {
                    BlocProvider.of<TransactionBloc>(context)
                        .add(TransactionCreate(_qualifiedModel));
                    LoadingDialog.hideLoadingDialog(context);
                    LoadingDialog.showNotifyDialog(context,
                        text: "Create Transaction Success \n" +
                            (_qualifiedModel?.transactionType ?? "") +
                            " done");
                    _qualifiedModel =
                        QualifiedModel("", "", "", "", "", "", "");
                  } on Exception {
                    LoadingDialog.hideLoadingDialog(context);
                    LoadingDialog.showNotifyDialog(context,
                        text: "Create Transaction Fail");
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 0.4 * size.width,
                  height: 0.06 * size.height,
                  child: GradientBackground(
                    borderRadius: BorderRadius.circular(10),
                    colors: const [PRIME_BLUE, ASCENT_BLUE],
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                            color: PRIME_WHITE,
                            fontWeight: FontWeight.w800,
                            fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  Future<CameraDescription> _getCamera() async {
    final cameras = await availableCameras();
    return cameras.first;
  }
}
