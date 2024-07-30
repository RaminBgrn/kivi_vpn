import 'package:flutter/material.dart';
import 'package:flutter_v2ray/flutter_v2ray.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/common/dialog_and_snack.dart';
import 'package:kivi_vpn/features/feature_v2ray/controller/v2ray_controller.dart';
import 'package:kivi_vpn/database/config_db.dart';
import 'package:kivi_vpn/features/feature_configs/model/config_model.dart';

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

  Future<String> getCurrentConfigAsDefault() async {
    final defaultConfigId = GetStorage();
    final configModel =
        await ConfigDb().fetchById(defaultConfigId.read('selected'));
    return configModel.json ?? '';
  }

  void fetchAllConfigs() async {
    final readBox = GetStorage();
    int selectedDefaultId = readBox.read('selected') ?? -1;
    _configsList.clear();
    _configsList.addAll(await ConfigDb().fetchAll());
    if (selectedDefaultId > 0) markSelectedConfig(selectedDefaultId);
    update();
  }

  void markSelectedConfig(int id) {
    for (var each in _configsList) {
      if (each.id == id) {
        each.isSelected = true;
      } else {
        each.isSelected = false;
      }
    }
    update();
  }

  void setConfigData(String link) async {
    try {
      ConfigModel model =
          Get.find<V2rayController>().getV2rayDataModelFromUrl(link);
      await ConfigDb().create(
          remark: model.remake ?? "Kivi Custom",
          ip: model.ip ?? "127.0.0.1",
          port: model.port ?? "000",
          network: model.network ?? 'tcp',
          json: model.json ?? "");
      fetchAllConfigs();
    } catch (error) {
      DialogAndSnack.showSnackBar(
          'خطای فرمت',
          'در حال حاضر فقط فرمت vmess, vless, trojan پشتیبانی می‌شود',
          myRed[900]!);
    }
  }

  void selectedConfig(int id) async {
    await _setDefaultConfig(id);
    for (var each in _configsList) {
      if (each.id == id) {
        each.isSelected = true;
        Get.find<V2rayController>().setConfig(each.json ?? '');
      } else {
        each.isSelected = false;
      }
    }
    update();
  }

  void getConfigPing(ConfigModel model) async {
    final v2rayController = Get.find<V2rayController>();
    if (v2rayController.getVpnState == "CONNECTED") {
      v2rayController.disconnect();
      var delay = await FlutterV2ray(onStatusChanged: (V2RayStatus status) {})
          .getServerDelay(config: model.json ?? '');
      model.delay = delay.toString();
      Future.delayed(const Duration(milliseconds: 200), () {
        v2rayController.connect();
      });
    } else {
      var delay = await FlutterV2ray(onStatusChanged: (V2RayStatus status) {})
          .getServerDelay(config: model.json ?? '');
      model.delay = delay.toString();
    }

    update();
  }

  Future<void> _setDefaultConfig(int id) async {
    final box = GetStorage();
    await box.write('selected', id);
  }

  void saveDataToDataBase() async {
    if (_configLinkController.text.isEmpty) {
      DialogAndSnack.showSnackBar(
          'خطا', 'فیلد لینک کانفیگ، نباید خالی باشه', myRed[900]!);
      return;
    }
    setConfigData(_configLinkController.text.trim());
    Get.back();
  }
}
