import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/core/v2ray_controller.dart';
import 'package:kivi_vpn/features/feature_configs/screen/configs_screen.dart';
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
      body: SafeArea(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          color: const Color(0xFF080808),
          child: SingleChildScrollView(
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
                const Gap(24),
                Text(
                  'مدت زمان اتصال شما ',
                  style: GoogleFonts.vazirmatn(
                    fontSize: 12,
                    color: myGrey[400],
                  ),
                ),
                const Gap(8),
                GetBuilder<V2rayController>(builder: (clr) {
                  return Text(
                    clr.getUpTime,
                    style: GoogleFonts.vazirmatn(
                        fontSize: 34,
                        color: myGrey[200],
                        fontWeight: FontWeight.w400),
                  );
                }),
                const Gap(12),
                const CurrentConfigWidget(),
                const Gap(12),
                GetBuilder<HomeController>(builder: (clr) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      HomeButton(
                        onTap: () {
                          clr.navigatePageView(0);
                        },
                        id: 0,
                        currentIndex: clr.getCurrentIndex,
                        icon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Assets.images.traffic
                              .image(width: 50, height: 50),
                        ),
                      ),
                      HomeButton(
                        onTap: () {
                          clr.navigatePageView(1);
                        },
                        id: 1,
                        currentIndex: clr.getCurrentIndex,
                        icon: Padding(
                          padding: const EdgeInsets.only(
                              top: 6.0, left: 6.0, bottom: 4.0),
                          child:
                              Assets.images.speed.image(width: 50, height: 50),
                        ),
                      ),
                      HomeButton(
                        onTap: () {
                          Get.to(const ConfigScreen());
                          clr.navigatePageView(0);
                        },
                        id: 3,
                        currentIndex: clr.getCurrentIndex,
                        icon:
                            Assets.images.servers.image(width: 50, height: 50),
                      ),
                    ],
                  );
                }),
                ExpandablePageView(
                  controller: Get.find<HomeController>().getPageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    HomeButtonsSection(),
                    SpeedTestSection(),
                  ],
                ),
                const Gap(36),
                ConnectButton(
                  onTap: () {
                    Get.find<HomeController>().connectDisconnect();
                  },
                ),
                const Gap(16),
                GetBuilder<V2rayController>(builder: (clr) {
                  return AutoSizeText(
                    clr.getVpnState == "CONNECTED" ? 'متصل شد' : "عدم اتصال",
                    presetFontSizes: const [16, 14, 12, 10, 8],
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    style: GoogleFonts.vazirmatn(
                      fontWeight: FontWeight.w300,
                      color: myGrey[400],
                    ),
                  );
                }),
                const Gap(16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
