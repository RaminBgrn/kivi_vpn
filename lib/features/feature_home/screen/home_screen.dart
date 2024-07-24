import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/features/feature_home/controller/home_controller.dart';
import 'package:kivi_vpn/features/feature_home/widget/connect_button.dart';
import 'package:kivi_vpn/features/feature_home/widget/current_config_widget.dart';
import 'package:kivi_vpn/features/feature_home/widget/home_button.dart';
import 'package:kivi_vpn/features/feature_home/widget/home_buttons_section.dart';
import 'package:kivi_vpn/features/feature_speed_test/widget/speed_test_section.dart';
import 'package:kivi_vpn/gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        color: const Color(0xFF080808),
        child: SafeArea(
          child: Column(
            children: [
              const Gap(24),
              Text(
                'Kivi VPN',
                style: GoogleFonts.vazirmatn(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Gap(34),
              Text(
                'مدت زمان اتصال شما ',
                style: GoogleFonts.vazirmatn(
                  fontSize: 12,
                  color: myGrey[400],
                ),
              ),
              const Gap(8),
              Text(
                '00:30:25',
                style: GoogleFonts.vazirmatn(
                    fontSize: 34,
                    color: myGrey[200],
                    fontWeight: FontWeight.w400),
              ),
              const Gap(12),
              const CurrentConfigWidget(),
              const Gap(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HomeButton(
                    backgroundColor: myOrange[300]!.withOpacity(0.1),
                    onTap: () {
                      Get.find<HomeController>()
                          .getPageController
                          .animateToPage(0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.fastEaseInToSlowEaseOut);
                    },
                    icon: Assets.svgs.traficPage.svg(
                      width: 40,
                      height: 40,
                      colorFilter: ColorFilter.mode(
                        myOrange[200]!,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  HomeButton(
                    backgroundColor: myGreen[300]!.withOpacity(0.1),
                    onTap: () {
                      Get.find<HomeController>()
                          .getPageController
                          .animateToPage(1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.fastEaseInToSlowEaseOut);
                    },
                    icon: Assets.svgs.speedTest.svg(
                      width: 50,
                      height: 50,
                      colorFilter: ColorFilter.mode(
                        myGreen[200]!,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  HomeButton(
                    backgroundColor: myPink[300]!.withOpacity(0.1),
                    onTap: () {},
                    icon: Assets.svgs.configPage.svg(
                      width: 40,
                      height: 40,
                      colorFilter: ColorFilter.mode(
                        myPink[200]!,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
              ExpandablePageView(
                controller: Get.find<HomeController>().getPageController,
                children: const [
                  HomeButtonsSection(),
                  SpeedTestSection(),
                ],
              ),
              const Expanded(child: SizedBox()),
              ConnectButton(
                onTap: () {},
              ),
              const Gap(16),
              AutoSizeText(
                'متصل شد',
                presetFontSizes: const [16, 14, 12, 10, 8],
                overflow: TextOverflow.fade,
                maxLines: 1,
                style: GoogleFonts.vazirmatn(
                  fontWeight: FontWeight.w300,
                  color: myGrey[400],
                ),
              ),
              const Gap(16),
            ],
          ),
        ),
      ),
    );
  }
}
