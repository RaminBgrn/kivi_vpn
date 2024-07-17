import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivi_vpn/core/base_controller.dart';
import 'package:kivi_vpn/features/feature_splash/screen/splash_screen.dart';
import 'package:kivi_vpn/features/feature_tour_intro/screen/tour_tutorial_intro_screen.dart';

void main() {
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
