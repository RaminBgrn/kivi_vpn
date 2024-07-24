import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ip_country_lookup/ip_country_lookup.dart';
import 'package:kivi_vpn/features/feature_home/model/config_model.dart';
import 'package:svg_flag/svg_flag.dart';

class HomeController extends GetxController {
  final ConfigModel _configModel = ConfigModel();
  ConfigModel get getConfigModel => _configModel;

  PageController _pageController = PageController();
  PageController get getPageController => _pageController;

  @override
  void onInit() {
    lookupToFlag();
    super.onInit();
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
