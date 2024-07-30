class ConfigModel {
  int? id;
  String? remake;
  String? ip;
  String? port;
  String? network;
  String? json;
  String? delay = "0";
  bool isSelected = false;

  ConfigModel({
    this.id,
    this.remake,
    this.json,
    this.delay = "0",
    this.ip,
    this.port,
    this.network,
    this.isSelected = false,
  });

  factory ConfigModel.fromDatabase(Map<String, dynamic> map) => ConfigModel(
      id: map['id']?.toInt() ?? 0,
      remake: map['remark'] ?? '',
      port: map['port'] ?? "000",
      ip: map['ip'] ?? "127.0.0.1",
      network: map['network'] ?? 'localhost',
      json: map['json'] ?? '');
}
