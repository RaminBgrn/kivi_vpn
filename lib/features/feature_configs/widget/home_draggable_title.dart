import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';

class HomeDraggableTitle extends StatelessWidget {
  const HomeDraggableTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
      child: Text(
        'لیست سرور ها',
        style: GoogleFonts.vazirmatn(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: myGrey[300],
        ),
      ),
    );
  }
}
