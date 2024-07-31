import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/common/dialog_and_snack.dart';
import 'package:kivi_vpn/database/config_db.dart';
import 'package:kivi_vpn/features/feature_configs/controller/configs_controller.dart';
import 'package:kivi_vpn/features/feature_configs/model/config_model.dart';

class EditConfigController extends GetxController {
  final TextEditingController _remakeTextController = TextEditingController();
  TextEditingController get getRemakeTextController => _remakeTextController;

  final TextEditingController _addressTextController = TextEditingController();
  TextEditingController get getAddressTextController => _addressTextController;

  final TextEditingController _portTextController = TextEditingController();
  TextEditingController get getPortTextController => _portTextController;

  final TextEditingController _uuidTextController = TextEditingController();
  TextEditingController get getUUIDTextController => _uuidTextController;

  final TextEditingController _alterIdTextController = TextEditingController();
  TextEditingController get getAlterIdTextController => _alterIdTextController;

  ConfigModel _configModel = ConfigModel();

  String _security = "none";
  String get getSecurity => _security;

  final List<String> _securityList = [
    'chacha20-poly1305',
    'aes-128-gcm',
    'auto',
    'none',
    'zero',
  ];
  List<String> get getSecurityList => _securityList;

  void initModel(ConfigModel model) {
    _configModel = model;

    Map<String, dynamic> configJson = jsonDecode(model.json ?? "");
    // log(model.json!);
    log(configJson['outbounds'][0]['settings']['vnext'][0]['users'][0]
        ['security']);
    _initSecurity(configJson['outbounds'][0]['settings']['vnext'][0]['users'][0]
        ['security']);
    _remakeTextController.text = model.remake ?? 'Kivi Custom';
    _addressTextController.text = model.ip ?? '127.0.0.1';
    _portTextController.text = model.port ?? "000";
    _uuidTextController.text =
        configJson['outbounds'][0]['settings']['vnext'][0]['users'][0]['id'];
    _alterIdTextController.text = configJson['outbounds'][0]['settings']
            ['vnext'][0]['users'][0]['alterId']
        .toString();
  }

  void _initSecurity(String security) {
    log('security in loop : $security');
    for (var listItem in _securityList) {
      if (security == listItem) {
        _security = listItem;
        update();
        return;
      }
    }
  }

  void onSecurityChange(String security) {
    _security = security;
  }

  void saveConfig() async {
    Map<String, dynamic> configJson = jsonDecode(_configModel.json ?? "");

    configJson['outbounds'][0]['settings']['vnext'][0]['address'] =
        _addressTextController.text;
    configJson['outbounds'][0]['settings']['vnext'][0]['port'] =
        int.tryParse(_portTextController.text) ?? 443;
    configJson['outbounds'][0]['settings']['vnext'][0]['users'][0]['id'] =
        _uuidTextController.text;
    configJson['outbounds'][0]['settings']['vnext'][0]['users'][0]['alterId'] =
        int.tryParse(_alterIdTextController.text) ?? 0;
    configJson['outbounds'][0]['settings']['vnext'][0]['users'][0]['security'] =
        _security;
    int result = await ConfigDb().updateConfig(
      id: _configModel.id!,
      remark: _remakeTextController.text,
      ip: _addressTextController.text,
      port: _portTextController.text,
      json: jsonEncode(configJson),
    );
    if (result > 0) {
      Get.find<ConfigsController>().fetchAllConfigs();
      Get.back();
      DialogAndSnack.showSnackBar(
          'موفق', 'کانفیگ با اطلاعات جدید بروز شد', myGreen[500]!);
    } else {
      DialogAndSnack.showSnackBar(
          'خطا', 'اطلاعات به درستی بروز رسانی نشد', myRed[500]!);
    }
    // log("address : " +
    //     configJson['outbounds'][0]['settings']['vnext'][0]['address']);
    // log("port : " +
    //     configJson['outbounds'][0]['settings']['vnext'][0]['port'].toString());
    // log("uuid : " +
    //     configJson['outbounds'][0]['settings']['vnext'][0]['users'][0]['id']);
    // log("alter id : " +
    //     configJson['outbounds'][0]['settings']['vnext'][0]['users'][0]
    //             ['alterId']
    //         .toString());
    // log("security : " +
    //     configJson['outbounds'][0]['settings']['vnext'][0]['users'][0]
    //         ['security']);
  }
}
