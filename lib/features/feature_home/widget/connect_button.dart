import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/features/feature_home/controller/home_controller.dart';
import 'package:kivi_vpn/gen/assets.gen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ConnectButton extends StatelessWidget {
  final VoidCallback onTap;
  const ConnectButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GetBuilder<HomeController>(builder: (clr) {
        return Container(
          width: 130,
          height: 130,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: clr.getButtonBackgroundColor,
          ),
          child: Container(
            width: 90,
            height: 90,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: clr.getButtonForegroundColor),
            child: clr.hasButtonClick
                ? LoadingAnimationWidget.threeRotatingDots(
                    color: enableButtonColor, size: 40)
                : Assets.svgs.connectButton.svg(),
          ),
        );
      }),
    );
  }
}
