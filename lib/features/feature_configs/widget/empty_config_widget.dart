import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/gen/assets.gen.dart';

class EmptyConfigWidget extends StatelessWidget {
  const EmptyConfigWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(64),
          Assets.images.emptyList.image(width: 200, height: 200),
          const Gap(28),
          AutoSizeText(
            '!هیچ کانفیگی اضافه نکردی',
            style: GoogleFonts.vazirmatn(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: myPurple[300],
            ),
          ),
        ],
      ),
    );
  }
}
