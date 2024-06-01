import 'package:flutter/material.dart';
import 'package:portfolio_client/widgets/projects_page/desktop/backend_widget.dart';

class SkillsDesktopMobile extends StatelessWidget {
  SkillsDesktopMobile({super.key, required this.screenwidth});

  var screenwidth;

  List<Map<String, String>> images_and_names = [
    {"img_path": 'assets/images/dart_1000x1000.png', "title": 'dart'},
    {"img_path": 'assets/images/flutter_1000x1000.png', "title": 'Flutter'},
    {"img_path": 'assets/images/python_1000x1000.png', "title": 'Python'},
    {"img_path": 'assets/images/django_1000x1000.png', "title": 'Django'},
    {"img_path": 'assets/images/nginx_1000x1000.png', "title": 'nginx'},
    {"img_path": 'assets/images/mysql_1000x1000.png', "title": 'MySql'},
    {"img_path": 'assets/images/docker_1000x1000.png', "title": 'Docker'},
  ];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        color: Color(0xff404258),
        padding:
            EdgeInsets.symmetric(horizontal: screenwidth / 10, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // todo : what i can do
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "What I Can Do",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                )
              ],
            ),

            //todo : tachnologies and fronrend backend

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    //todo :backend frontend card
                    BackendWidgetDesktop(
                      svg_path: 'assets/images/server.svg',
                      text: '\nBackend & APIs',
                      screenwidth: screenwidth,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    BackendWidgetDesktop(
                      svg_path: 'assets/images/app.svg',
                      text: '\nCross plateform\nClient Apps',
                      screenwidth: screenwidth,
                    ),

                    SizedBox(
                      height: 32,
                    ),

                    Container(
                        height: 200,
                        width: screenwidth / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: images_and_names.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 100,
                                padding: EdgeInsets.all(8),
                                child: ListTile(
                                  leading: Image.asset(
                                      images_and_names[index]['img_path']!),
                                  title:
                                      Text(images_and_names[index]['title']!),
                                ),
                              );
                            }))
                  ],
                ),

                //todo end
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
