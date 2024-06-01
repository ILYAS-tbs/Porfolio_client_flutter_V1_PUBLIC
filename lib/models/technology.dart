class TechModel {
  final int id;
  final String color;
  final String name;

  TechModel({
    required this.id,
    required this.color,
    required this.name,
  });

  factory TechModel.fromJson(Map<String, dynamic> json) {
    return TechModel(
      id: json['id'],
      color: json['color'],
      name: json['name'],
    );
  }
}
