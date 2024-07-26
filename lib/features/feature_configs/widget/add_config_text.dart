import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/gen/assets.gen.dart';

class AddConfigText extends StatelessWidget {
  const AddConfigText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 286,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8),
        child: Column(
          children: [
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  decoration: InputDecoration(
                    label: Text(
                      'لینک کانفیگ رو وارد کن',
                      style: GoogleFonts.vazirmatn(
                        fontSize: 14,
                        color: myGrey[400],
                      ),
                    ),
                    enabledBorder: _border(),
                    border: _border(),
                    focusedBorder: _border(),
                  ),
                  maxLines: 18,
                ),
              ),
            ),
            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: myRed[900]!.withOpacity(0.3),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'انصراف',
                          style: GoogleFonts.vazirmatn(
                              fontSize: 14, color: myGrey[300]),
                        ),
                        const Gap(4),
                        Assets.svgs.cancel.svg(
                          width: 30,
                          height: 30,
                          colorFilter:
                              ColorFilter.mode(myRed[400]!, BlendMode.srcIn),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: myGreen[900]!.withOpacity(0.3),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'اضافه کردن',
                          style: GoogleFonts.vazirmatn(
                              fontSize: 14, color: myGrey[300]),
                        ),
                        const Gap(4),
                        Assets.svgs.add.svg(
                          width: 30,
                          height: 30,
                          colorFilter:
                              ColorFilter.mode(myGreen[400]!, BlendMode.srcIn),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  InputBorder _border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: enableButtonColor,
          width: 0.5,
        ));
  }
}
