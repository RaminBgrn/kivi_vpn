import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';

class EditHeader extends StatelessWidget {
  final String title;
  const EditHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 20,
      child: Row(
        children: [
          const Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              height: 1,
              color: myGrey[500],
            ),
          ),
          const Gap(4),
          Text(
            title,
            textDirection: TextDirection.rtl,
            style: GoogleFonts.vazirmatn(
                fontSize: 14, fontWeight: FontWeight.bold, color: myGrey[400]),
          ),
          const Gap(4),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              height: 1,
              color: myGrey[500],
            ),
          ),
          const Expanded(flex: 1, child: SizedBox())
        ],
      ),
    );
  }
}
