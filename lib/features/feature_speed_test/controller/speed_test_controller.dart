import 'dart:developer';

import 'package:flutter_internet_speed_test/flutter_internet_speed_test.dart';
import 'package:get/get.dart';

class SpeedTestController extends GetxController {
  final _speedTest = FlutterInternetSpeedTest();
  FlutterInternetSpeedTest get getSpeedTest => _speedTest;

  double _centerData = 0;
  double get getCenterData => _centerData;

  double _downloadSpeed = 0;
  double get getDownloadSpeed => _downloadSpeed;

  double _uploadSpeed = 0;
  double get getUploadSpeed => _uploadSpeed;

  TestType _testType = TestType.DOWNLOAD;
  TestType get getTestType => _testType;

  SpeedUnit? _speedUnit;
  SpeedUnit? get getSpeedUnit => _speedUnit;

  void startSpeedTest() {
    _centerData = 0.0;
    _uploadSpeed = 0.0;
    _downloadSpeed = 0.0;
    _speedTest.startTesting(
      downloadTestServer: 'http://speed.cloudflare.com/',
      uploadTestServer: 'https://speed.cloudflare.com/__up',
      onProgress: (double percent, TestResult data) {
        _speedUnit = data.unit;
        _centerData = data.transferRate;
        if (data.type == TestType.DOWNLOAD) {
          _downloadSpeed = data.transferRate;
        } else {
          _uploadSpeed = data.transferRate;
        }
        update();
      },
      onError: (String errorMessage, String speedTestError) {
        if (_uploadSpeed <= 0) {}
        log(errorMessage);
        _centerData = 0;
        update();
      },
      onDone: (TestResult download, TestResult upload) {
        _downloadSpeed = download.transferRate;
        _uploadSpeed = upload.transferRate;
        update();
      },
    );
  }
}
