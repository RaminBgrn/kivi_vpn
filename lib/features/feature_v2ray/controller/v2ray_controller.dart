import 'package:flutter_v2ray/flutter_v2ray.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/common/dialog_and_snack.dart';
import 'package:kivi_vpn/database/config_db.dart';
import 'package:kivi_vpn/features/feature_configs/model/config_model.dart';
import 'package:kivi_vpn/features/feature_home/controller/home_controller.dart';

class V2rayController extends GetxController {
  // late V2RayURL _parser;
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

  String _fullConfigurationAsString = "";
  String get getConfigDataAsString => _fullConfigurationAsString;

  ConfigModel _model = ConfigModel();

  @override
  void onInit() async {
    final storage = GetStorage();
    int id = storage.read('selected') ?? -1;
    if (id > 0) _model = await ConfigDb().fetchById(storage.read('selected'));
    try {
      // _parser = FlutterV2ray.parseFromURL(model.address ?? '');
      // _fullConfigurationAsString = _parser.getFullConfiguration();
      _fullConfigurationAsString = _model.json ?? '';
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
    _address = _model.ip ?? "127.0.0.1";
    _port = _model.port.toString();
    _remark = _model.remake ?? 'Kivi Custom';
    _flutterV2ray.requestPermission();
    update();

    super.onReady();
  }

  void setConfig(ConfigModel model) async {
    _model = model;
    update();
    // if (_vpnState == "CONNECTED") disconnect();
    try {
      _fullConfigurationAsString = model.json!;
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

  ConfigModel getV2rayDataModelFromUrl(String url) {
    V2RayURL userImport = FlutterV2ray.parseFromURL(url);
    return ConfigModel(
        remake: userImport.remark,
        ip: userImport.address,
        port: userImport.port.toString(),
        network: userImport.network,
        json: userImport.getFullConfiguration());
  }

  // edit config file
  // void editLinkConfiguration() async {
  //   final jsonData = _parser.getFullConfiguration();
  //   // final link = jsonDecode(utf8.decode(base64Decode(jsonData)));
  //   final configStr = jsonEncode(jsonData);

  //   final link = utf8.encode(configStr);

  //   final bytes = base64UrlEncode(link);
  //   final json = jsonDecode(
  //     utf8.decode(
  //       base64Decode(bytes),
  //     ),
  //   );

  //   // log(json.toString());
  //   // Future.delayed(const Duration(milliseconds: 500), () {
  //   V2RayURL testParser = FlutterV2ray.parseFromURL(
  //       "vless://81ea895f-0c0d-4018-b712-75dd08a29b26@tr1.asc-sam.ir:80?security=&type=ws&path=/vless&host=tr1.asc-sam.ir&encryption=none#%F0%9F%87%B9%F0%9F%87%B7-@NoForcedHeaven");
  //   log(testParser.removeNulls(testParser.fullConfiguration));
  //   // });
  // }

  void connect() async {
    _address = _model.ip ?? '127.0.0.1';
    _port = _model.port.toString();
    _remark = _model.remake ?? 'Kivi Custom';
    update();
    await _flutterV2ray.initializeV2Ray();

    if (await _flutterV2ray.requestPermission()) {
      _flutterV2ray.startV2Ray(
          remark: _model.remake ?? "Kivi Custom",
          config: _fullConfigurationAsString,
          proxyOnly: false);
    }
  }

  void disconnect() {
    _flutterV2ray.stopV2Ray();
  }
}
