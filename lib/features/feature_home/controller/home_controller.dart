import 'dart:developer';

import 'package:flutter_internet_speed_test/flutter_internet_speed_test.dart';
import 'package:get/get.dart';
import 'package:internet_speed_meter/internet_speed_meter.dart';
import 'package:ip_country_lookup/ip_country_lookup.dart';
import 'package:kivi_vpn/features/feature_home/model/config_model.dart';
import 'package:svg_flag/svg_flag.dart';

class HomeController extends GetxController {
  final ConfigModel _configModel = ConfigModel();
  ConfigModel get getConfigModel => _configModel;

  final speedTest = FlutterInternetSpeedTest();

  @override
  void onInit() {
    lookupToFlag();
    super.onInit();
  }

  InternetSpeedMeter _internetSpeedMeterPlugin = InternetSpeedMeter();

  void speedListener() {
    _internetSpeedMeterPlugin.getCurrentInternetSpeed().listen((speed) {
      print('Current Speed: $speed');
    });
  }

  void download() {
    speedTest.startTesting(
      downloadTestServer: 'http://fast.com/',
      uploadTestServer: 'http://speed.io',
      fileSize: 2000,
      onProgress: (double percent, TestResult data) {
        log(data.transferRate.toString());
        log("speed type ${data.type.name}");
        log('speed unit : ${data.unit}');
      },
      onError: (String errorMessage, String speedTestError) {
        log(speedTestError);
      },
      onDone: (TestResult download, TestResult upload) {
        log('download : ${download.transferRate}');
        log('upload : ${upload.transferRate}');
      },
    );
  }

  // locking for current internet ip and country name and flag
  void lookupToFlag() async {
    final countryData = await IpCountryLookup().getIpLocationData();
    for (int i = 0; i < FlagData.values.length; i++) {
      if (FlagData.values[i].source.split("/").last.split('.').first ==
          countryData.country_code!.toLowerCase()) {
        _configModel.countryFlag = FlagData(FlagData.values[i].source);
        _configModel.ipAddress = countryData.ip;
        _configModel.title = countryData.country_name;
        update();
        break;
      }
    }
  }
}
