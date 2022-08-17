// this.status_IS, required this.criticality, required this.expert, required this.responsible_for_development, required this.responsible_for_maintenance, required this.functions_IS, required this.producer_IS, required this.domain, required this.subdomain, required this.created_at, required this.updated_at,
class DataModel {
  final int id;
  final String GUID;
  final String name;
  // final String status_IS;
  // final String criticality;
  // final String expert;
  // final String responsible_for_development;
  // final String responsible_for_maintenance;
  // final String functions_IS;
  // final String producer_IS;
  // final String domain;
  // final String subdomain;
  // final String created_at;
  // final String updated_at;

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

  ///this method will prevent the override of toString
  String GUIDAsString() {
    return '#${this.id} ${this.GUID} ${this.name}';
  }

  // ///this method will prevent the override of toString
  // bool userFilterByCreationDate(String filter) {
  //   return this?.createdAt?.toString()?.contains(filter);
  // }

  ///custom comparing function to check if two users are equal
  bool isEqual(DataModel model) {
    return this.id == model.id;
  }

  @override
  String toString() => "| " + GUID + " | " + name;
}