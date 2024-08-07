import 'package:get/get.dart';
import 'package:kivi_vpn/core/i_shared_preference.dart';
import 'package:kivi_vpn/features/feature_v2ray/controller/v2ray_controller.dart';
import 'package:kivi_vpn/features/feature_home/controller/home_controller.dart';
import 'package:kivi_vpn/features/feature_speed_test/controller/speed_test_controller.dart';

class BaseController extends Bindings {
  @override
  void dependencies() {
    Get.put(V2rayController());
    Get.put(ISharedPreference());
    Get.put(SpeedTestController());
    Get.put(HomeController());
  }
}
