import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/features/feature_home/controller/home_controller.dart';
import 'package:svg_flag/svg_flag.dart';

class CurrentConfigWidget extends StatelessWidget {
  const CurrentConfigWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF111418),
      ),
      child: GetBuilder<HomeController>(builder: (clr) {
        return Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xFF1B202A)),
              child: clr.getCountryDataModel.countryFlag == null
                  ? const SizedBox(width: 52, height: 50)
                  : SvgFlag(
                      clr.getCountryDataModel.countryFlag!,
                      width: 50,
                      height: 50,
                    ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    clr.getCountryDataModel.title ?? 'Unknown',
                    presetFontSizes: const [24, 22, 20, 18, 16],
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    style: GoogleFonts.vazirmatn(
                      fontWeight: FontWeight.bold,
                      color: myGrey[300],
                    ),
                  ),
                  AutoSizeText(
                    clr.getCountryDataModel.ipAddress ?? 'Unknown',
                    presetFontSizes: const [16, 14, 12, 10, 8],
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    style: GoogleFonts.vazirmatn(
                      fontWeight: FontWeight.w300,
                      color: myGrey[400],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(8),
          ],
        );
      }),
    );
  }
}
