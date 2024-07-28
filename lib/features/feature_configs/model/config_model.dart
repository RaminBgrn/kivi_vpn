class ConfigModel {
  int? id;
  String? remake;
  String? address;
  String? ip;
  String? port;
  String? network;
  String? delay = "0";
  bool isSelected = false;

  ConfigModel({
    this.id,
    this.remake,
    this.address,
    this.delay = "0",
    this.ip,
    this.port,
    this.network,
    this.isSelected = false,
  });

  factory ConfigModel.fromDatabase(Map<String, dynamic> map) => ConfigModel(
      id: map['id']?.toInt() ?? 0,
      remake: map['title'] ?? '',
      ip: map['ip'] ?? "127.0.0.1",
      port: map['port'] ?? "000",
      network: map['network'] ?? 'localhost',
      address: map['link'] ?? '');
}
