import 'package:svg_flag/svg_flag.dart';

class CountryDataModel {
  FlagData? countryFlag;
  String? ipAddress;
  String? title;
  String? isp;

  CountryDataModel({
    this.countryFlag,
    this.ipAddress,
    this.title,
    this.isp,
  });
}
