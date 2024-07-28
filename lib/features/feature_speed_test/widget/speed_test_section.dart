import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internet_speed_test/flutter_internet_speed_test.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/core/v2ray_controller.dart';
import 'package:kivi_vpn/features/feature_home/controller/home_controller.dart';
import 'package:kivi_vpn/features/feature_home/widget/trafic_item.dart';
import 'package:kivi_vpn/features/feature_speed_test/controller/speed_test_controller.dart';
import 'package:kivi_vpn/features/feature_speed_test/widget/speed_test_details.dart';
import 'package:kivi_vpn/gen/assets.gen.dart';

class SpeedTestSection extends StatefulWidget {
  const SpeedTestSection({super.key});

  @override
  State<SpeedTestSection> createState() => _SpeedTestSectionState();
}

class _SpeedTestSectionState extends State<SpeedTestSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: MediaQuery.sizeOf(context).width,
      height: 200,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF111418),
      ),
      child: Column(
        children: [
          Expanded(
            child: GetBuilder<SpeedTestController>(
              builder: (clr) {
                // Get.find<V2rayController>().getConnectedConfigDelay();

                return Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: DashedCircularProgressBar.aspectRatio(
                        progress: clr.getCenterData,
                        aspectRatio: 1,
                        startAngle: 245,
                        sweepAngle: 230,
                        foregroundColor: clr.getTestType == TestType.DOWNLOAD
                            ? myBlueGrey[400]!
                            : myPurple[400]!,
                        seekColor: clr.getTestType == TestType.DOWNLOAD
                            ? myBlueGrey[700]!
                            : myPurple[900]!,
                        seekSize: 10,
                        backgroundColor: myGrey[400]!,
                        foregroundStrokeWidth: 8,
                        backgroundStrokeWidth: 8,
                        child: Center(
                          child: clr.getSpeedTest.isTestInProgress()
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      clr.getCenterData.toStringAsFixed(2),
                                      style: GoogleFonts.vazirmatn(
                                        fontSize: 32,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      clr.getSpeedUnit != null
                                          ? clr.getSpeedUnit!.name
                                          : '-',
                                      style: GoogleFonts.vazirmatn(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              : TextButton(
                                  onPressed: () {
                                    clr.startSpeedTest();
                                  },
                                  child: Text(
                                    'شروع تست',
                                    style: GoogleFonts.vazirmatn(
                                      fontSize: 16,
                                      color: myGrey[300],
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: GetBuilder<HomeController>(builder: (clr) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GetBuilder<V2rayController>(builder: (clr) {
                              if (clr.getVpnState == "CONNECTED") {
                                clr.getConnectedConfigDelay();
                              }
                              return SpeedTestDetails(
                                title: 'تاخیر سرور',
                                data: (clr.getServerDelay > 0)
                                    ? clr.getServerDelay.toString()
                                    : "متصل نیست",
                                titleColor: myOrange[200]!,
                              );
                            }),
                            const Gap(14),
                            SpeedTestDetails(
                              title: 'آی‌پی',
                              data: clr.getCountryDataModel.ipAddress ??
                                  '0.0.0.0',
                              titleColor: myOrange[200]!,
                            ),
                            const Gap(14),
                            SpeedTestDetails(
                              title: 'سرور',
                              data: clr.getCountryDataModel.isp ?? 'نامشخص',
                              titleColor: myOrange[200]!,
                            ),
                          ],
                        );
                      }),
                    ),
                  ],
                );
              },
            ),
          ),
          GetBuilder<SpeedTestController>(builder: (clr) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TraficItem(
                    icon: Assets.svgs.download.svg(
                      width: 40,
                      height: 40,
                      colorFilter:
                          ColorFilter.mode(myBlueGrey[400]!, BlendMode.srcIn),
                    ),
                    title: "دانلود",
                    speed: clr.getDownloadSpeed.toString()),
                TraficItem(
                    icon: Assets.svgs.upload.svg(
                      width: 40,
                      height: 40,
                      colorFilter:
                          ColorFilter.mode(myPurple[400]!, BlendMode.srcIn),
                    ),
                    title: "آپلود",
                    speed: clr.getUploadSpeed.toString()),
              ],
            );
          })
        ],
      ),
    );
  }
}
