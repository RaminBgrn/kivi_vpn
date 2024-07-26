import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/gen/assets.gen.dart';

class HomeDraggableHeader extends StatelessWidget {
  const HomeDraggableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(flex: 4, child: Assets.images.serverHead.image()),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AutoSizeText(
                    'لیست سرور‌ها',
                    presetFontSizes: const [24, 22, 20],
                    maxLines: 1,
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.vazirmatn(
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                        color: myGrey[200]),
                  ),
                  const Gap(26),
                  AutoSizeText(
                    'اینجا میتونی تمام کانفیگ‌هایی که \n به برنامه اضافه کردی رو ببینی!  ',
                    presetFontSizes: const [14, 12, 10],
                    maxLines: 2,
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.vazirmatn(
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                        color: myGrey[200]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
