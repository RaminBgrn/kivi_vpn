import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivi_vpn/core/i_shared_preference.dart';
import 'package:kivi_vpn/features/feature_home/screen/home_screen.dart';

class TourTutorialController extends GetxController {
  final PageController _pageController = PageController();
  PageController get getPageController => _pageController;

  int _currentPage = 1;

  void onNextButtonClick() {
    if (_currentPage >= 3) {
      onSkipButtonClick();
    } else {
      _pageController.animateToPage(_currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastLinearToSlowEaseIn);
      _currentPage++;
    }
  }

  void onSkipButtonClick() {
    Get.find<ISharedPreference>().setTourTutorialData();
    Get.offAll(const HomeScreen());
  }
}
