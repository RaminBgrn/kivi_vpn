import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/features/feature_configs/model/config_model.dart';
import 'package:kivi_vpn/gen/assets.gen.dart';

class ConfigItem extends StatelessWidget {
  final ConfigModel model;
  const ConfigItem({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 110,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: disableButtonColor,
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      model.remake ?? 'Unknown',
                      presetFontSizes: const [18, 16, 14],
                      maxLines: 1,
                      style: GoogleFonts.vazirmatn(
                        fontWeight: FontWeight.bold,
                        color: myGrey[300],
                      ),
                    ),
                    const Gap(4),
                    AutoSizeText(
                      model.address ?? 'Unknown',
                      presetFontSizes: const [14, 12, 10],
                      maxLines: 1,
                      style: GoogleFonts.vazirmatn(
                        fontWeight: FontWeight.normal,
                        color: myGrey[300],
                      ),
                    ),
                  ],
                ),
                Container(
                    width: 90,
                    height: 28,
                    padding: const EdgeInsets.all(2),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: myOrange[500]!.withOpacity(0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '4820',
                          style: GoogleFonts.vazirmatn(
                            fontSize: 12,
                            color: myOrange[200],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Gap(8),
                        Text(
                          ': پینگ',
                          style: GoogleFonts.vazirmatn(
                            fontSize: 14,
                            color: myOrange[200],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Assets.svgs.delete.svg(
                      colorFilter:
                          ColorFilter.mode(myRed[300]!, BlendMode.srcIn),
                    ),
                  ),
                  const Gap(8),
                  GestureDetector(
                    onTap: () {},
                    child: Assets.svgs.edit.svg(
                      colorFilter:
                          ColorFilter.mode(myOrange[300]!, BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Assets.svgs.run.svg(
                    width: 30,
                    height: 30,
                    colorFilter:
                        ColorFilter.mode(myGrey[300]!, BlendMode.srcIn)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
