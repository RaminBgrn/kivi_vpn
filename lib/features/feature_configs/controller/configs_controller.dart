import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivi_vpn/features/feature_configs/model/config_model.dart';

class ConfigsController extends GetxController {
  List<ConfigModel> _configsList = [];
  List<ConfigModel> get getConfigsList => _configsList;

  final PageController _dialogPageViewController = PageController();
  PageController get getDialogPageViewController => _dialogPageViewController;

  void switchFromLinkToCamera(int page) {
    _dialogPageViewController.animateToPage(page,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastEaseInToSlowEaseOut);
  }
}
