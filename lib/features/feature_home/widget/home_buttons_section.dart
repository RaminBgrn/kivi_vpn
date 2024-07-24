import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/core/v2ray_controller.dart';
import 'package:kivi_vpn/features/feature_home/widget/trafic_item.dart';
import 'package:kivi_vpn/gen/assets.gen.dart';

class HomeButtonsSection extends StatelessWidget {
  const HomeButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<V2rayController>(builder: (clr) {
      return Container(
        width: MediaQuery.sizeOf(context).width,
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFF111418),
        ),
        child: Column(
          children: [
            AutoSizeText(
              clr.getRemark,
              presetFontSizes: const [18, 16, 14],
              maxLines: 1,
              style: GoogleFonts.vazirmatn(
                color: myGrey[300]!,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  'آدرس : ${clr.getAddress}',
                  textDirection: TextDirection.rtl,
                  presetFontSizes: const [14, 12, 10],
                  maxLines: 1,
                  style: GoogleFonts.vazirmatn(
                    color: myGrey[400]!,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  height: 40,
                  width: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.transparent,
                        Colors.white.withOpacity(0.3),
                        Colors.transparent
                      ])),
                ),
                AutoSizeText(
                  'پورت : ${clr.getPort}',
                  presetFontSizes: const [14, 12, 10],
                  maxLines: 1,
                  style: GoogleFonts.vazirmatn(
                    color: myGrey[400]!,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // trafic section
              ],
            ),
            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TraficItem(
                  icon: Assets.svgs.download.svg(width: 30, height: 30),
                  title: 'دانلود',
                  speed: clr.getDownloadSpeed,
                ),
                TraficItem(
                  icon: Assets.svgs.upload.svg(width: 30, height: 30),
                  title: 'آپلود',
                  speed: clr.getUploadSpeed,
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
