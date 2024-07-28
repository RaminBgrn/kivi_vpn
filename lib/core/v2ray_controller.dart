import 'package:flutter_v2ray/flutter_v2ray.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/common/dialog_and_snack.dart';
import 'package:kivi_vpn/database/config_db.dart';
import 'package:kivi_vpn/features/feature_configs/model/config_model.dart';
import 'package:kivi_vpn/features/feature_home/controller/home_controller.dart';

class V2rayController extends GetxController {
  late V2RayURL _parser;
  late FlutterV2ray _flutterV2ray;

  String _vpnState = "DISCONNECTED";
  String get getVpnState => _vpnState;

  String _downloadSpeed = "";
  String get getDownloadSpeed => _downloadSpeed;

  String _uploadSpeed = "";
  String get getUploadSpeed => _uploadSpeed;

  String _address = "0.0.0.0";
  String get getAddress => _address;

  String _port = "000";
  String get getPort => _port;

  String _remark = "localhost";
  String get getRemark => _remark;

  String _connectionTime = "00:00:00";
  String get getUpTime => _connectionTime;

  int _serverDelay = 0;
  int get getServerDelay => _serverDelay;

  @override
  void onInit() async {
    final storage = GetStorage();
    ConfigModel model = await ConfigDb().fetchById(storage.read('selected'));
    try {
      _parser = FlutterV2ray.parseFromURL(model.address ?? '');
      _flutterV2ray = FlutterV2ray(onStatusChanged: (state) {
        _vpnState = state.state;
        _downloadSpeed = state.downloadSpeed;
        _uploadSpeed = state.uploadSpeed;
        _connectionTime = state.duration;
        update();
      });
      await _flutterV2ray.initializeV2Ray();
    } catch (e) {
      DialogAndSnack.showSnackBar(
          'خطا', 'کانفیگ پیش فرض یافت پیدا نشد', myRed[500]!);
    }
    super.onInit();
  }

  @override
  void onReady() {
    _address = _parser.address;
    _port = _parser.port.toString();
    _remark = _parser.remark;
    update();

    super.onReady();
  }

  void setConfig(String config) async {
    // if (_vpnState == "CONNECTED") disconnect();
    try {
      _parser = FlutterV2ray.parseFromURL(config);
      await _flutterV2ray.initializeV2Ray();
      // connect();
      if (_vpnState == "CONNECTED") {
        disconnect();
        await Future.delayed(const Duration(milliseconds: 200), () {
          connect();
        });
      }
      Get.find<HomeController>().checkConnectionData();
    } catch (e) {
      DialogAndSnack.showSnackBar(
          'خطا', "لینک کانفیگ به درستی تنظیم نشد", myRed[900]!);
    }
  }

  void getConnectedConfigDelay() async {
    int delay = await _flutterV2ray.getConnectedServerDelay();
    _serverDelay = delay;
    update();
  }

  void connect() async {
    _address = _parser.address;
    _port = _parser.port.toString();
    _remark = _parser.remark;
    update();
    await _flutterV2ray.initializeV2Ray();
    if (await _flutterV2ray.requestPermission()) {
      _flutterV2ray.startV2Ray(
          remark: _parser.remark,
          config: _parser.getFullConfiguration(),
          proxyOnly: false);
    }
  }

  void disconnect() {
    _flutterV2ray.stopV2Ray();
  }
}
