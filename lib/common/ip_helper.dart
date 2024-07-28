import 'package:ip_country_lookup/ip_country_lookup.dart';
import 'package:kivi_vpn/features/feature_home/model/country_data_model.dart';
import 'package:svg_flag/svg_flag.dart';

class IpHelper {
  // locking for current internet ip and country name and flag
  static Future<CountryDataModel> lookupToFlag() async {
    await Future.delayed(const Duration(seconds: 1));
    final countryData = await IpCountryLookup().getIpLocationData();
    for (int i = 0; i < FlagData.values.length; i++) {
      if (FlagData.values[i].source.split("/").last.split('.').first ==
          countryData.country_code!.toLowerCase()) {
        return CountryDataModel(
            countryFlag: FlagData(FlagData.values[i].source),
            ipAddress: countryData.ip,
            title: countryData.country_name,
            isp: countryData.isp ?? "نامشخص");
      }
    }
    return CountryDataModel();
  }
}
