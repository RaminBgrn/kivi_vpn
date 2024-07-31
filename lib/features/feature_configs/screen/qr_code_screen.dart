import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivi_vpn/features/feature_configs/controller/configs_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({super.key});

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: QRView(
            overlay: QrScannerOverlayShape(
              borderWidth: 5,
              borderColor: Colors.amber,
              overlayColor: Colors.black.withOpacity(0.6),
              cutOutHeight: 290,
              cutOutWidth: 290,
            ),
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        Get.find<ConfigsController>().setConfigData(scanData.code.toString());
        controller.stopCamera();
        Get.back();
      }
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
