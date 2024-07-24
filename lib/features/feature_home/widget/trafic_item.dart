import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';

class TraficItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final String speed;
  const TraficItem(
      {required this.icon,
      required this.title,
      required this.speed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          icon,
          const Gap(4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AutoSizeText(
                title,
                textDirection: TextDirection.rtl,
                presetFontSizes: const [13, 11, 9],
                maxLines: 1,
                style: GoogleFonts.vazirmatn(
                  color: myGrey[400]!,
                  fontWeight: FontWeight.w400,
                ),
              ),
              AutoSizeText(
                '$speed KB/s',
                presetFontSizes: const [14, 12, 10],
                maxLines: 1,
                style: GoogleFonts.vazirmatn(
                  color: myGrey[300]!,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
