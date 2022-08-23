// this.status_IS, required this.criticality, required this.expert, required this.responsible_for_development, required this.responsible_for_maintenance, required this.functions_IS, required this.producer_IS, required this.domain, required this.subdomain, required this.created_at, required this.updated_at,
class DataModel {
  final int id;
  final String GUID;
  final String name;

  DataModel({required this.id, required this.GUID, required this.name});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {

    }
    return DataModel(
      id: json["id"],
      GUID: json["GUID"],
      name: json["name"],
    );
  }

  static List<DataModel> fromJsonList(List list) {
    if (list == null) {
     // return null;
    }
    return list.map((item) => DataModel.fromJson(item)).toList();
  }


  @override
  String toString() => "| " + GUID + " | " + name;
}