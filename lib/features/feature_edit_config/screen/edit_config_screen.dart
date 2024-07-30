import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/features/feature_edit_config/widgets/edit_confgi_text_input.dart';

class EditConfigScreen extends StatelessWidget {
  const EditConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: myGrey[900]!,
        body: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(52),
                Text(
                  'ویرایش کانفیگ',
                  style: GoogleFonts.vazirmatn(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: myGrey[200]),
                ),
                const Gap(28),
                EditConfigTextInput(
                  controller: TextEditingController(),
                  title: "نام کانفیگ",
                ),
              ],
            ),
          ),
        ));
  }
}
