import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/features/feature_home/model/config_model.dart';
import 'package:kivi_vpn/features/feature_home/widget/current_config_widget.dart';
import 'package:svg_flag/svg_flag.dart';

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
              CurrentConfigWidget(
                model: ConfigModel(
                  countryFlag: FlagData.tr,
                  title: "United States",
                  ipAddress: "127.0.0.1",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
