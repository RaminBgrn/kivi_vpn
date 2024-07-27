import 'package:flutter_v2ray/flutter_v2ray.dart';
import 'package:get/get.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/common/dialog_and_snack.dart';

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
    _parser = FlutterV2ray.parseFromURL(
        'vmess://eyJhZGQiOiJbMmEwMTo0Zjg6MWMxYjo5OTk6OjFdIiwiYWlkIjoiMCIsImhvc3QiOiIiLCJpZCI6IjZkOWQ4NDM0LTIzMjAtNDI4MS1iNTA5LTc5N2VkNTc0MzRlOSIsIm5ldCI6InRjcCIsInBhdGgiOiIiLCJwb3J0IjoiNDQzIiwicHMiOiJpcHY2LURvbmF0ZSIsInNjeSI6ImF1dG8iLCJzbmkiOiIiLCJ0bHMiOiIiLCJ0eXBlIjoibm9uZSIsInYiOiIyIn0=');
    _flutterV2ray = FlutterV2ray(onStatusChanged: (state) {
      _vpnState = state.state;
      _downloadSpeed = state.downloadSpeed;
      _uploadSpeed = state.uploadSpeed;
      _connectionTime = state.duration;
      update();
    });

    await _flutterV2ray.initializeV2Ray();
    super.onInit();
  }

  void setConfigData(String link) async {
    disconnect();
    try {
      _parser = FlutterV2ray.parseFromURL(link);
      await _flutterV2ray.initializeV2Ray();
    } catch (e) {
      DialogAndSnack.showSnackBar(
          'خطای فرمت', 'متاسفانه کانفیگ به درستی تنظیم نشد', myRed[900]!);
    }
    connect();
  }

  @override
  void onReady() {
    _address = _parser.address;
    _port = _parser.port.toString();
    _remark = _parser.remark;
    update();

    super.onReady();
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
    } else {
      connect();
    }
  }

  void disconnect() {
    _flutterV2ray.stopV2Ray();
  }
}
