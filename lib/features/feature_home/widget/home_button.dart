import 'package:flutter/material.dart';
import 'package:kivi_vpn/common/colors.dart';

class HomeButton extends StatefulWidget {
  final Widget icon;
  final VoidCallback onTap;
  final int id;
  final int currentIndex;
  const HomeButton(
      {required this.icon,
      required this.onTap,
      required this.id,
      required this.currentIndex,
      super.key});

  @override
  State<HomeButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 80,
        height: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
              width: 1,
              color: (widget.currentIndex == widget.id)
                  ? myGreen[800]!.withOpacity(0.9)
                  : myGrey[500]!),
          color: (widget.currentIndex == widget.id)
              ? myGreen[800]!.withOpacity(0.3)
              : myGrey[700]!.withOpacity(0.2),
        ),
        child: widget.icon,
      ),
    );
  }
}
