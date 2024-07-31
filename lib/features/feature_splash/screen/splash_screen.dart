import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivi_vpn/features/feature_home/screen/home_screen.dart';
import 'package:kivi_vpn/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation, _scaleAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _initFadeAnimation();
    _initScaleAnimation();
    _startAnimation();
    _navigationBetweenPage();
    super.initState();
  }

  void _initScaleAnimation() {
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  void _initFadeAnimation() {
    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 300), () {
      _animationController.forward();
    });
  }

  void _navigationBetweenPage() {
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        Future.delayed(const Duration(milliseconds: 500), () {
          Get.offAll(() => const HomeScreen());
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Stack(
        children: [
          SizedBox(
            child: Assets.images.splashBackground.image(),
          ),
          ScaleTransition(
            scale: _scaleAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Center(
                child: Assets.images.logo.image(
                  width: 180,
                  height: 180,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
