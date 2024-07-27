import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/common/dialog_and_snack.dart';
import 'package:kivi_vpn/core/v2ray_controller.dart';
import 'package:kivi_vpn/features/feature_configs/model/config_model.dart';
import 'package:kivi_vpn/features/feature_home/controller/home_controller.dart';

class ConfigsController extends GetxController {
  final List<ConfigModel> _configsList = [];
  List<ConfigModel> get getConfigsList => _configsList;

  final TextEditingController _configLinkController = TextEditingController();
  TextEditingController get getConfigLinkController => _configLinkController;

  final PageController _dialogPageViewController = PageController();
  PageController get getDialogPageViewController => _dialogPageViewController;

  void switchFromLinkToCamera(int page) {
    _dialogPageViewController.animateToPage(page,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastEaseInToSlowEaseOut);
  }

  void saveDataToDataBase() async {
    if (_configLinkController.text.isEmpty) {
      DialogAndSnack.showSnackBar(
          'خطا', 'فیلد لینک کانفیگ، نباید خالی باشه', myRed[900]!);
      return;
    }
    final controller = Get.find<V2rayController>();
    controller.setConfigData(_configLinkController.text.trim());
    Get.back();
    Get.find<HomeController>().lookupToFlag();
  }
}
