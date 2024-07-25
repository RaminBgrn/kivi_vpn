import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/gen/assets.gen.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF080808),
        body: SafeArea(
          child: Column(
            children: [
              const Gap(18),
              AutoSizeText(
                'سرویس‌‌های وی‌پی‌ان',
                style: GoogleFonts.vazirmatn(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: myGrey[300]!,
                ),
              ),
              Assets.images.serverHead.image(width: 100, height: 100)
            ],
          ),
        ));
  }
}
