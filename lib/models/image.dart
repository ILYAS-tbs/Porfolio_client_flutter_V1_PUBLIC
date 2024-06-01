class ImageModel {
  final int id;
  final String name;
  final String img;

  ImageModel({
    required this.id,
    required this.img,
    required this.name,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(id: json['id'], img: json['img'], name: json['name']);
  }
}
