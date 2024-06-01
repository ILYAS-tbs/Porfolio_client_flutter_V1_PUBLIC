import 'package:portfolio_client/models/image.dart';
import 'package:portfolio_client/models/links.dart';
import 'package:portfolio_client/models/technology.dart';
import 'package:portfolio_client/models/video.dart';

class ProjectModel {
  final int id;

  //! links  ---
  // todo : will be handled later it is nestedn and has array .. hard to model
  final LinksModel links;

  //! technologies
  final List<TechModel> technologies;
  //! image_set
  final List<ImageModel> image_set;
  //! video_set
  final List<VideoModel> video_set;

  final String name;
  final String desc;
  final String system_design;
  final String thumnail;
  final String status;

  ProjectModel({
    required this.id,
    required this.links,
    required this.technologies,
    required this.image_set,
    required this.video_set,
    required this.name,
    required this.desc,
    required this.system_design,
    required this.thumnail,
    required this.status,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    // todo : transformers for nested data  and arrays
    List<ImageModel> transform_images_set(List<dynamic> images) {
      List<ImageModel> result = [];

      for (int i = 0; i < images.length; i++) {
        result.add(ImageModel.fromJson(images[i]));
      }

      print(result);
      return result;
    }

    List<VideoModel> transform_video_set(List<dynamic> videos) {
      List<VideoModel> result = [];

      for (int i = 0; i < videos.length; i++) {
        result.add(VideoModel.fromJson(videos[i]));
      }

      print(result);
      return result;
    }

    List<TechModel> transform_tech_set(List<dynamic> techs) {
      List<TechModel> result = [];

      for (int i = 0; i < techs.length; i++) {
        result.add(TechModel.fromJson(techs[i]));
      }

      print(result);
      return result;
    }

    //! the final and ready model
    return ProjectModel(
      id: json['id'],
      links: LinksModel.fromJson(json['links']),
      technologies: transform_tech_set(json['technologies']),
      image_set: transform_images_set(json['image_set']),
      video_set: transform_video_set(json['video_set']),
      name: json['name'],
      desc: json['desc'],
      system_design: json['system_design'],
      thumnail: json['thumnail'],
      status: json['status'],
    );
  }
}
