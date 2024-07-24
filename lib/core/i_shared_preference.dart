import 'package:get/get.dart';
import 'package:kivi_vpn/static/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ISharedPreference extends GetxController {
  late final SharedPreferences sp;

  @override
  void onInit() async {
    sp = await SharedPreferences.getInstance();
    super.onInit();
  }

  bool readTourTutorialData() {
    bool result = sp.getBool(Keys.introTourTutorialKey) ?? false;
    return result;
  }

  void setTourTutorialData() {
    sp.setBool(Keys.introTourTutorialKey, true);
  }
}
