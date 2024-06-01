import 'package:flutter/cupertino.dart';
import 'package:portfolio_client/models/project_model.dart';
import 'package:portfolio_client/widgets/projects_page/desktop/card.dart';

class ProjectsDesktopMobile extends StatelessWidget {
  ProjectsDesktopMobile({super.key, required this.projects});

  List<ProjectModel> projects;

  List<Widget> getProjectWidgets() {
    List<Widget> widgets = [];
    for (int i = 0; i < projects.length; i++) {
      widgets.add(MyCard(
        project: projects[i],
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xff222831),
        //   height: 1000,
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Projects",
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),

            //todo : cards
            Container(
              constraints: BoxConstraints(maxWidth: 900),
              child: Column(
                children: [
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 16,
                      runSpacing: 16,
                      children: getProjectWidgets(),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
