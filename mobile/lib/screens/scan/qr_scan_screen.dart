import 'dart:io';

import 'package:mobile/blocs/transaction_bloc/bloc.dart';
import 'package:mobile/global/theme.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRScreen extends StatefulWidget {
  const ScanQRScreen({Key? key}) : super(key: key);

  @override
  _ScanQRScreenState createState() => _ScanQRScreenState();
}

class _ScanQRScreenState extends State<ScanQRScreen> {
  Barcode? result;
  late QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            child: CustomAppBar(
              text: "Scan QR Code",
              textColor: ABSOLUTE_WHITE,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            height: size.height * 0.07,
          ),
          SizedBox(height: size.height * 0.93, child: _buildQrView(context)),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 240.0
        : 240.0;
    return QRView(
      key: qrKey,
      cameraFacing: CameraFacing.front,
      onQRViewCreated: (QRViewController controller) {
        setState(() {
          this.controller = controller;
        });
        controller.scannedDataStream.listen((scanData) async {
          setState(() {
            result = scanData;
            BlocProvider.of<TransactionBloc>(context)
                .add(TransactionQRFetch(qRCode: result?.code));
            Navigator.of(context).pop();
            controller.dispose();
          });
        });
      },
      formatsAllowed: const [BarcodeFormat.qrcode],
      overlay: QrScannerOverlayShape(
        borderColor: ASCENT_BLUE,
        borderRadius: 3,
        borderLength: 30,
        borderWidth: 8,
        cutOutSize: scanArea,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
