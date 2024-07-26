import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeReader extends StatefulWidget {
  const QrCodeReader({super.key});

  @override
  State<QrCodeReader> createState() => _QrCodeReaderState();
}

class _QrCodeReaderState extends State<QrCodeReader> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        width: 260,
        height: 260,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: QRView(
              overlay: QrScannerOverlayShape(
                borderWidth: 5,
                borderColor: Colors.amber,
                overlayColor: Colors.black.withOpacity(0.6),
                cutOutHeight: 200,
                cutOutWidth: 200,
              ),
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
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
}
