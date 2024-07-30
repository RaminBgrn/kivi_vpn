import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/features/feature_configs/controller/configs_controller.dart';
import 'package:kivi_vpn/features/feature_configs/model/config_model.dart';
import 'package:kivi_vpn/features/feature_configs/widget/ping.dart';
import 'package:kivi_vpn/features/feature_edit_config/screen/edit_config_screen.dart';
import 'package:kivi_vpn/gen/assets.gen.dart';

class ConfigItem extends StatelessWidget {
  final ConfigModel model;
  const ConfigItem({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<ConfigsController>().selectedConfig(model.id!);
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 128,
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
                width: 1,
                color: model.isSelected ? enableButtonColor : myGrey[800]!),
            color: myGrey[800]!),
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
                      Row(
                        children: [
                          AutoSizeText(
                            model.ip ?? 'Unknown',
                            presetFontSizes: const [14, 12, 10],
                            maxLines: 1,
                            style: GoogleFonts.vazirmatn(
                              fontWeight: FontWeight.normal,
                              color: myGrey[400],
                            ),
                          ),
                          AutoSizeText(
                            ":",
                            presetFontSizes: const [14, 12, 10],
                            maxLines: 1,
                            style: GoogleFonts.vazirmatn(
                              fontWeight: FontWeight.normal,
                              color: myGrey[400],
                            ),
                          ),
                          AutoSizeText(
                            model.port ?? 'Unknown',
                            presetFontSizes: const [14, 12, 10],
                            maxLines: 1,
                            style: GoogleFonts.vazirmatn(
                              fontWeight: FontWeight.normal,
                              color: myGrey[400],
                            ),
                          ),
                        ],
                      ),
                      const Gap(4),
                      AutoSizeText(
                        model.network!,
                        presetFontSizes: const [14, 12, 10],
                        maxLines: 1,
                        style: GoogleFonts.vazirmatn(
                          fontWeight: FontWeight.normal,
                          color: myGrey[400],
                        ),
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Ping(model: model)),
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
                      onTap: () {
                        // Get.find<V2rayController>().editLinkConfiguration();
                      },
                      child: Assets.svgs.delete.svg(
                        colorFilter:
                            ColorFilter.mode(myRed[300]!, BlendMode.srcIn),
                      ),
                    ),
                    const Gap(8),
                    GestureDetector(
                      onTap: () {
                        Get.to(const EditConfigScreen());
                      },
                      child: Assets.svgs.edit.svg(
                        colorFilter:
                            ColorFilter.mode(myOrange[300]!, BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.find<ConfigsController>().getConfigPing(model);
                  },
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
      ),
    );
  }
}
