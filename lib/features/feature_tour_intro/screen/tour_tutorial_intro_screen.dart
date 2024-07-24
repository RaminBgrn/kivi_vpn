import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/features/feature_tour_intro/controller/tour_tutorial_controller.dart';
import 'package:kivi_vpn/gen/assets.gen.dart';

class TourTutorialIntroScreen extends StatelessWidget {
  const TourTutorialIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF080808),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller:
                    Get.find<TourTutorialController>().getPageController,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Assets.images.introFirst.image(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Assets.images.introSecond.image(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Assets.images.introThird.image(),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.find<TourTutorialController>().onNextButtonClick();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: enableButtonColor,
                      fixedSize: Size(MediaQuery.sizeOf(context).width, 64),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Text(
                      'ادامه',
                      style: GoogleFonts.vazirmatn(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Gap(18),
                GestureDetector(
                  onTap: () {
                    Get.find<TourTutorialController>().onSkipButtonClick();
                  },
                  child: Text(
                    'رد شدن',
                    style: GoogleFonts.vazirmatn(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Gap(32)
              ],
            )
          ],
        ),
      ),
    );
  }
}
