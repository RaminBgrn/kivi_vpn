import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/features/feature_configs/model/config_model.dart';
import 'package:kivi_vpn/features/feature_configs/widget/config_item.dart';
import 'package:kivi_vpn/gen/assets.gen.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF080808),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: myGrey[800],
          child: Assets.svgs.add.svg(
              width: 40,
              height: 40,
              colorFilter: ColorFilter.mode(myGreen[500]!, BlendMode.srcIn)),
        ),
        body: SafeArea(
          child: DraggableHome(
              appBarColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              headerExpandedHeight: 0.3,
              title: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Text(
                  'لیست سرور ها',
                  style: GoogleFonts.vazirmatn(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: myGrey[300],
                  ),
                ),
              ),
              headerWidget: SizedBox(
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
              ),
              body: [
                ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      return ConfigItem(
                          model: ConfigModel(
                              address: '192.168.102.139',
                              delay: '784',
                              isSelected: index == 2 ? true : false,
                              remake: "Ramin-Irancell"));
                    }),
              ]),
        ));
  }
}
