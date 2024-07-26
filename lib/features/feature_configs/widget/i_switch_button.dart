import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/features/feature_configs/controller/configs_controller.dart';
import 'package:kivi_vpn/gen/assets.gen.dart';

class ISwitchButton extends StatefulWidget {
  const ISwitchButton({super.key});

  @override
  State<ISwitchButton> createState() => ISwitchButtonState();
}

class ISwitchButtonState extends State<ISwitchButton> {
  late Alignment _switchAlignment;

  @override
  void initState() {
    _switchAlignment = Alignment.centerLeft;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 48,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: myGrey[900],
      ),
      child: Stack(children: [
        AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: _switchAlignment,
          child: Container(
            width: 130,
            height: 54,
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: enableButtonColor,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory),
                  onPressed: () {
                    if (_switchAlignment != Alignment.centerLeft) {
                      Get.find<ConfigsController>().switchFromLinkToCamera(0);

                      setState(() {
                        _switchAlignment = Alignment.centerLeft;
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        'لینک کانفیگ',
                        presetFontSizes: const [16, 14, 12],
                        maxLines: 1,
                        style: GoogleFonts.vazirmatn(
                          color: myGrey[200],
                        ),
                      ),
                      const Gap(4),
                      Assets.svgs.text.svg(
                        colorFilter: ColorFilter.mode(
                          myGrey[300]!,
                          BlendMode.srcIn,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory),
                  onPressed: () {
                    if (_switchAlignment != Alignment.centerRight) {
                      Get.find<ConfigsController>().switchFromLinkToCamera(1);
                      setState(() {
                        _switchAlignment = Alignment.centerRight;
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        'کد QR',
                        presetFontSizes: const [16, 14, 12],
                        maxLines: 1,
                        style: GoogleFonts.vazirmatn(
                          color: myGrey[200],
                        ),
                      ),
                      const Gap(4),
                      Assets.svgs.camera.svg(
                        colorFilter: ColorFilter.mode(
                          myGrey[300]!,
                          BlendMode.srcIn,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
