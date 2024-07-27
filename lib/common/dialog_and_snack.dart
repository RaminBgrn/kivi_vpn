import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';

class DialogAndSnack {
  static void showSnackBar(
    String title,
    String message,
    Color backgroundColor,
  ) {
    Get.snackbar('', '',
        titleText: AutoSizeText(
          title,
          presetFontSizes: const [16, 14, 12],
          maxLines: 1,
          textDirection: TextDirection.rtl,
          style: GoogleFonts.vazirmatn(
            fontWeight: FontWeight.bold,
            color: myGrey[200],
          ),
        ),
        messageText: AutoSizeText(
          message,
          presetFontSizes: const [14, 12, 10],
          maxLines: 1,
          textDirection: TextDirection.rtl,
          style: GoogleFonts.vazirmatn(
            color: myGrey[300],
          ),
        ),
        backgroundColor: backgroundColor.withOpacity(0.2));
  }
}
