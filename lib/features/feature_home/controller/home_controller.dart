import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ip_country_lookup/ip_country_lookup.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/core/v2ray_controller.dart';
import 'package:kivi_vpn/features/feature_home/model/country_data_model.dart';
import 'package:svg_flag/svg_flag.dart';

class HomeController extends GetxController {
  final CountryDataModel _configModel = CountryDataModel();
  CountryDataModel get getConfigModel => _configModel;

  final PageController _pageController = PageController();
  PageController get getPageController => _pageController;

  Color _buttonBackgroundColor = disableButtonColor.withOpacity(0.4);
  Color get getButtonBackgroundColor => _buttonBackgroundColor;

  Color _buttonForegroundColor = disableButtonColor;
  Color get getButtonForegroundColor => _buttonForegroundColor;

  bool _animationFlag = false;
  bool get hasButtonClick => _animationFlag;

  String _isp = "نامشخص";
  String get getISP => _isp;

  int _currentIndex = 0;
  int get getCurrentIndex => _currentIndex;

  void initButtonColor() {
    final controller = Get.find<V2rayController>();
    log(controller.getVpnState);
    if (controller.getVpnState == "CONNECTED") {
      _buttonBackgroundColor = enableButtonColor.withOpacity(0.4);
      _buttonForegroundColor = enableButtonColor;
    }
    update();
  }

  @override
  void onReady() {
    lookupToFlag();
    initButtonColor();
    super.onReady();
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
        _isp = countryData.isp ?? "نامشخص";
        update();
        break;
      }
    }
  }

  void connectDisconnect() {
    final controller = Get.find<V2rayController>();
    if (controller.getVpnState == "DISCONNECTED") {
      controller.connect();
      _animationFlag = true;
      update();
      Future.delayed(const Duration(seconds: 3), () {
        lookupToFlag();
        _buttonBackgroundColor = enableButtonColor.withOpacity(0.4);
        _buttonForegroundColor = enableButtonColor;
        _animationFlag = false;
        update();
      });
    } else {
      controller.disconnect();
      _buttonBackgroundColor = disableButtonColor.withOpacity(0.4);
      _buttonForegroundColor = disableButtonColor;
      update();
      Future.delayed(const Duration(milliseconds: 500), () {
        lookupToFlag();
      });
    }
  }

  void navigatePageView(int index) {
    _currentIndex = index;
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastEaseInToSlowEaseOut);
    update();
  }
}
