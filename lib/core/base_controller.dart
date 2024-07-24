import 'package:get/get.dart';
import 'package:kivi_vpn/core/i_shared_preference.dart';
import 'package:kivi_vpn/features/feature_home/controller/home_controller.dart';

class BaseController extends Bindings {
  @override
  void dependencies() {
    Get.put(ISharedPreference());
    Get.put(HomeController());
  }
}
