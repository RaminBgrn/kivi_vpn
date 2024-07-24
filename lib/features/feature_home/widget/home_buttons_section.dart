import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/features/feature_home/widget/trafic_item.dart';
import 'package:kivi_vpn/gen/assets.gen.dart';

class HomeButtonsSection extends StatelessWidget {
  const HomeButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
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
            'Irancell-Ramin',
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
                'آدرس : 127.0.0.1',
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
                'پورت : 443',
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
                speed: "245",
              ),
              TraficItem(
                icon: Assets.svgs.upload.svg(width: 30, height: 30),
                title: 'آپلود',
                speed: "145",
              ),
            ],
          )
        ],
      ),
    );
  }
}
