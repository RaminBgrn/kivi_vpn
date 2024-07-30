import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
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

  final List<String> _securityList = [
    'chacha20-poly1305',
    'aes-128-gcm',
    'auto',
    'none',
    'zero',
  ];
  List<String> get getSecurityList => _securityList;

  void initModel(ConfigModel model) {
    Map<String, dynamic> configJson = jsonDecode(model.json ?? "");
    log(model.json!);
    _remakeTextController.text = model.remake ?? 'Kivi Custom';
    _addressTextController.text = model.ip ?? '127.0.0.1';
    _portTextController.text = model.port ?? "000";
    _uuidTextController.text =
        configJson['outbounds'][0]['settings']['vnext'][0]['users'][0]['id'];
    _alterIdTextController.text = configJson['outbounds'][0]['settings']
            ['vnext'][0]['users'][0]['alterId']
        .toString();
  }
}
