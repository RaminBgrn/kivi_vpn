import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/common/dialog_and_snack.dart';
import 'package:kivi_vpn/common/ip_helper.dart';
import 'package:kivi_vpn/features/feature_v2ray/controller/v2ray_controller.dart';
import 'package:kivi_vpn/features/feature_home/model/country_data_model.dart';

class HomeController extends GetxController {
  CountryDataModel _countryDataModel = CountryDataModel();
  CountryDataModel get getCountryDataModel => _countryDataModel;

  final PageController _pageController = PageController();
  PageController get getPageController => _pageController;

  Color _buttonBackgroundColor = myGrey[800]!.withOpacity(0.4);
  Color get getButtonBackgroundColor => _buttonBackgroundColor;

  Color _buttonForegroundColor = myGrey[700]!;
  Color get getButtonForegroundColor => _buttonForegroundColor;

  bool _animationFlag = false;
  bool get hasButtonClick => _animationFlag;

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
  void onReady() async {
    checkConnectionData();
    super.onReady();
  }

  void checkConnectionData() async {
    _countryDataModel = await IpHelper.lookupToFlag();
    update();
  }

  void connectDisconnect() {
    final controller = Get.find<V2rayController>();
    if (controller.getConfigDataAsString.isEmpty) {
      DialogAndSnack.showSnackBar(
          'خطا', 'هیچ کانفیگی برای اتصال پیدا نشد', myRed[500]!);
      return;
    }
    if (controller.getVpnState == "DISCONNECTED") {
      controller.connect();
      _animationFlag = true;
      update();
      Future.delayed(const Duration(seconds: 3), () {
        checkConnectionData();
        _buttonBackgroundColor = enableButtonColor.withOpacity(0.4);
        _buttonForegroundColor = enableButtonColor;
        _animationFlag = false;
        update();
      });
    } else {
      controller.disconnect();
      _buttonBackgroundColor = myGrey[800]!;
      _buttonForegroundColor = myGrey[700]!;
      update();
      checkConnectionData();
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
