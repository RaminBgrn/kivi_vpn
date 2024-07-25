import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpeedTestDetails extends StatelessWidget {
  final String title;
  final String data;
  final Color titleColor;
  const SpeedTestDetails(
      {required this.title,
      required this.data,
      required this.titleColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: AutoSizeText(
            data,
            presetFontSizes: const [14, 13, 12],
            maxLines: 1,
            style: GoogleFonts.vazirmatn(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: AutoSizeText(
            title,
            textDirection: TextDirection.rtl,
            presetFontSizes: const [14, 13, 12],
            maxLines: 1,
            style: GoogleFonts.vazirmatn(
              color: titleColor,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
