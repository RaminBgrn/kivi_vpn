import 'package:flutter/material.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/gen/assets.gen.dart';

class ConnectButton extends StatelessWidget {
  final VoidCallback onTap;
  const ConnectButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130,
        height: 130,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: buttonColor.withOpacity(0.4),
        ),
        child: Container(
          width: 90,
          height: 90,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: buttonColor,
          ),
          child: Assets.svgs.connectButton.svg(
            width: 40,
            height: 40,
          ),
        ),
      ),
    );
  }
}
