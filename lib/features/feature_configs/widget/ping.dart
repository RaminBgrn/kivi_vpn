import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kivi_vpn/common/colors.dart';
import 'package:kivi_vpn/features/feature_configs/model/config_model.dart';

class Ping extends StatefulWidget {
  final ConfigModel model;
  const Ping({required this.model, super.key});

  @override
  State<Ping> createState() => _PingState();
}

class _PingState extends State<Ping> {
  late Color _textColor;
  late Color _backgroundColor;

  @override
  void initState() {
    setState(() {
      _textColor = myGrey[200]!;
      _backgroundColor = myGrey[900]!;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _switchColor(widget.model.delay ?? "-1");
    return Container(
      width: 90,
      height: 28,
      padding: const EdgeInsets.all(2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: _backgroundColor.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.model.delay.toString(),
            style: GoogleFonts.vazirmatn(
              fontSize: 12,
              color: _textColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Gap(8),
          Text(
            ': پینگ',
            style: GoogleFonts.vazirmatn(
              fontSize: 14,
              color: _textColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  void _switchColor(String ping) {
    int temp = int.tryParse(ping) ?? -1;
    if (temp < 500 && temp > 0) {
      setState(() {
        _textColor = myGreen[200]!;
        _backgroundColor = myGreen[500]!;
      });
    } else if (temp > 500 && temp < 1000) {
      setState(() {
        _textColor = myOrange[200]!;
        _backgroundColor = myOrange[500]!;
      });
    } else if (temp == 0) {
      setState(() {
        _textColor = myGrey[200]!;
        _backgroundColor = myGrey[500]!;
      });
    } else {
      setState(() {
        _textColor = myRed[200]!;
        _backgroundColor = myRed[500]!;
      });
    }
  }
}
