import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/gen/assets.gen.dart';

class HomeDraggableHeader extends StatelessWidget {
  const HomeDraggableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const Gap(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: myOrange[900]!.withOpacity(0.3),
                  ),
                  child: Assets.svgs.qrCode.svg(
                    width: 30,
                    height: 30,
                    colorFilter: ColorFilter.mode(
                      myOrange[400]!,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const Gap(12),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: myGreen[900]!.withOpacity(0.3),
                  ),
                  child: Assets.svgs.clipboard.svg(
                    width: 30,
                    height: 30,
                    colorFilter: ColorFilter.mode(
                      myGreen[400]!,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const Gap(12),
            ],
          ),
          Expanded(
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
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
