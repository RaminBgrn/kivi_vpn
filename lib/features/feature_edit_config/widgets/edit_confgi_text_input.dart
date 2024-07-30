import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';

class EditConfigTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String title;

  const EditConfigTextInput({
    required this.controller,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: controller,
          style: GoogleFonts.vazirmatn(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: myGrey[200],
          ),
          decoration: InputDecoration(
            label: Text(
              title,
              style: GoogleFonts.vazirmatn(
                  color: myGrey[300],
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
            ),
            border: _border(myGrey[600]!),
            enabledBorder: _border(myGrey[600]!),
            focusedBorder: _border(enableButtonColor),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _border(Color borderColor) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: borderColor,
          width: 1,
        ));
  }
}
