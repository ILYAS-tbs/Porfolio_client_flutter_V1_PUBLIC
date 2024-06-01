import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_client/models/links.dart';
import 'package:portfolio_client/models/project_model.dart';
import 'package:portfolio_client/shared/constants.dart';

import 'dart:js' as js;

class ImageAndSoftwareDesktop900 extends StatelessWidget {
  ImageAndSoftwareDesktop900(
      {super.key, required this.screenwidth, required this.project});

  var screenwidth;

  ProjectModel project;

  List<Map<String, dynamic>> contacts_needchange = [
    {"contact": 'assets/icons/android.svg', "changeColor": true},
    {"contact": 'assets/icons/github.svg', "changeColor": true},
    {"contact": 'assets/icons/ios-apple.svg', "changeColor": true},
    {"contact": 'assets/icons/web.svg', "changeColor": true},
  ];

  // todo : dynamic here is list of Index for "contacts_needchange" list and String link
  Map<String, dynamic> get_project_links(ProjectModel project) {
    Map<String, dynamic> project_links_map = {};
    var links = project.links;
    String client_repo = links.client_repo;
    String server_repo = links.server_repo;

    project_links_map['client_repo'] = [client_repo, 1];
    project_links_map['server_repo'] = [server_repo, 1];

    //todo : use ".toLowerCase" to avoid case-sensitivity issues

    List<DeployedLinksModel> deployedlinks_set = links.deployedlinks_set;

    for (int i = 0; i < deployedlinks_set.length; i++) {
      String plateform = deployedlinks_set[i].plateform.toLowerCase();

      int index;
      if (plateform == 'web') {
        index = 3;
      } else if (plateform == "android") {
        index = 0;
      } else {
        index = 2;
      }

      project_links_map[plateform] = [
        deployedlinks_set[i].deployment_link,
        index
      ];
    }

    return project_links_map;
  }

  late Map<String, dynamic> project_links = get_project_links(project);


   // todo : handle case sensivity for the data comming from the server using : toLowerCase
  List<Map<String, String>> get_technologies() {
    List<Map<String, String>> techs = [];

    for (int i = 0; i < project.technologies.length; i++) {
      var name_lowered = project.technologies[i].name.toLowerCase();
      techs.add(
        {
          "img_path": 'assets/images/${name_lowered}_1000x1000.png',
          "title": project.technologies[i].name
        },
      );
    }

    return techs;
  }

  // todo : getting the necessary data from the APIs using functions/methodes
  late List<Map<String, String>> images_and_names = get_technologies();


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      padding: EdgeInsets.only(left: screenwidth / 10, right: screenwidth / 20),
      decoration: BoxDecoration(
        color: Color(0xff222831),
      ),
      child: Row(
        children: [
          //! image and availabele on
          Container(
            //     color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(maxHeight: 600, maxWidth: 500),
                  height: screenwidth * 0.7,
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(32)),
                  width: screenwidth * 0.5,
                  child: Image.network(
                    "${ServerData.SERVER_URL}/${project.thumnail}",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "available on ",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    for (var key in project_links.keys)
                      if (contacts_needchange[project_links[key][1]]
                              ['changeColor'] ==
                          true)
                        InkWell(
                          onTap: () {
                            js.context
                                .callMethod('open', [project_links[key][0]]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: SvgPicture.asset(
                              contacts_needchange[project_links[key][1]]
                                  ['contact'],
                              height: 20,
                              width: 20,
                              color: Colors.white,
                            ),
                          ),
                        )
                    // else
                    //   Padding(
                    //     padding: const EdgeInsets.all(4.0),
                    //     child: SvgPicture.asset(
                    //       contacts_needchange[i]['contact'],
                    //       height: 20,
                    //       width: 20,
                    //     ),
                    //   )
                  ],
                )
              ],
            ),
          ),
          //! overview :
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: screenwidth * 0.05,
                left: 16,
              ),
              margin: EdgeInsets.only(left: screenwidth / 20),
              //  color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      //  color: Colors.blue,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Portfolio Software",
                            style: TextStyle(
                                fontSize: screenwidth * 0.03,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      //      color: Colors.pink,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      height: 200,
                      child: ListView(
                        padding: EdgeInsets.all(16),
                        children: [
                          Text(
                            " overview",
                            style: TextStyle(
                                fontSize: screenwidth * 0.02,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            project.desc,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(
                            "Techologies",
                            style: TextStyle(
                                fontSize: screenwidth * 0.02,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 100,
                            //  color: Colors.red,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  for (int i = 0;
                                      i < images_and_names.length;
                                      i++)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        images_and_names[i]['img_path']!,
                                        height: 50,
                                        width: 50,
                                      ),
                                    )
                                ],
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
