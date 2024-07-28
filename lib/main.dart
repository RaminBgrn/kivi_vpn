import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/core/base_controller.dart';
import 'package:kivi_vpn/features/feature_splash/screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kivi VPN',
      initialBinding: BaseController(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: enableButtonColor,
          primary: enableButtonColor,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
