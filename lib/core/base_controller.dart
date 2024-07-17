import 'package:get/get.dart';
import 'package:kivi_vpn/core/i_shared_preference.dart';

class BaseController extends Bindings {
  @override
  void dependencies() {
    Get.put(ISharedPreference());
  }
}
