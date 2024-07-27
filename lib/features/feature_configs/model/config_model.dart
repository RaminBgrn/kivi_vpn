class ConfigModel {
  int? id;
  String? remake;
  String? address;
  String? delay = "0";
  bool isSelected = false;

  ConfigModel({
    this.id,
    this.remake,
    this.address,
    this.delay = "0",
    this.isSelected = false,
  });

  factory ConfigModel.fromDatabase(Map<String, dynamic> map) => ConfigModel(
      id: map['id']?.toInt() ?? 0,
      remake: map['title'] ?? '',
      address: map['link'] ?? '');
}
