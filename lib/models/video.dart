class VideoModel {
  final int id;
  final String name;
  final String video;

  VideoModel({
    required this.id,
    required this.name,
    required this.video,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      name: json['name'],
      video: json['video'],
    );
  }
}
