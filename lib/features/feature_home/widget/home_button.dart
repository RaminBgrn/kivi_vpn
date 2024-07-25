import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final Color backgroundColor;
  final Widget icon;
  final VoidCallback onTap;
  const HomeButton(
      {required this.backgroundColor,
      required this.icon,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: backgroundColor,
        ),
        child: icon,
      ),
    );
  }
}
