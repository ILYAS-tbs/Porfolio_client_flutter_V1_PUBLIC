import 'dart:convert';

import 'package:flutter/cupertino.dart';

class LinksModel {
  final int id;
  final List<DeployedLinksModel> deployedlinks_set;
  final String client_repo;
  final String server_repo;

  LinksModel({
    required this.id,
    required this.deployedlinks_set,
    required this.client_repo,
    required this.server_repo,
  });

  factory LinksModel.fromJson(Map<String, dynamic> json) {
    List<DeployedLinksModel> transform_deployedlinks_set(
        List<dynamic> deployed_links) {
      List<DeployedLinksModel> result = [];
      for (int i = 0; i < deployed_links.length; i++) {
        result.add(DeployedLinksModel.fromJson(deployed_links[i]));
      }

      print('#######');
      print(result);
      print('#######');

      return result;
    }

    return LinksModel(
      id: json['id'],
      deployedlinks_set: transform_deployedlinks_set(json['deployedlinks_set']),
      client_repo: json['client_repo'],
      server_repo: json['server_repo'],
    );
  }
}

class DeployedLinksModel {
  final int id;
  final String deployment_link;
  final String plateform;

  DeployedLinksModel({
    required this.id,
    required this.deployment_link,
    required this.plateform,
  });

  factory DeployedLinksModel.fromJson(Map<String, dynamic> json) {
    return DeployedLinksModel(
      id: json['id'],
      deployment_link: json['deployment_link'],
      plateform: json['plateform'],
    );
  }
}






  // todo : array of deployed links from json : 
 //!  input :
// /*   "deployedlinks_set": [
//             {
//                 "id": 1,
//                 "deployment_link": "https://github.com/django",
//                 "plateform": "web",
//                 "created": "10:12:27.659759",
//                 "updated": "10:12:27.659768",
//                 "links": 1
//             }
//         ],
//  */
//     void get_deployedlinks_set(Map<String , dynamic> jsonList){ 
//     final  List<DeployedLinks> deployed_links = jsonDecode(jsonList['deployedlinks_set']);
//     print(deployed_links);


//    };
