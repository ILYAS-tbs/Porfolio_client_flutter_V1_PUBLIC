import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:portfolio_client/models/project_model.dart';
import 'package:portfolio_client/shared/constants.dart';

import 'dart:convert';

class HttpService {
  static HttpService? _instance;

  //! private constuctor :
  HttpService._();

  //! special - getter :
  static HttpService Instance() {
    if (_instance == null) {
      return HttpService._();
    }

    return _instance!;
  }

  //! constancts --- cahnge later to /shared/

  final log = Logger('MyClassName');

  //! Methodes :
  Future<ProjectModel> getProject(int id) async {
    final String URI1 = '${ServerData.PROJECT_URL}/${id}';

    final uri = Uri.parse(URI1);
    final response = await http.get(uri);

    //  todo : print the result ;
    // log.warning('Response status: ${response.statusCode}');
    // log.warning('Response body: ${response.body}');

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final project_model = ProjectModel.fromJson(jsonDecode(response.body));

    return project_model;
  }

  // todo : to reformat the list of projects :
  List<ProjectModel> transform_projects(dynamic jsonProjects) {
    List<ProjectModel> projects = [];

    for (int i = 0; i < jsonProjects.length; i++) {
      //todo : here each object is a project_model (Map<String,dynamic>)
      var project_object = jsonProjects[i];

      projects.add(ProjectModel.fromJson(project_object));
    }

    return projects;
  }

  Future<List<ProjectModel>> get_projects() async {
    final String URI = "${ServerData.SERVER_URL}/api/projects/";

    final uri = Uri.parse(URI);
    final response = await http.get(uri);

    final projects = transform_projects(jsonDecode(response.body));

    print("projects : ${response}");

    return projects;
  }
}
