import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio_client/models/project_model.dart';
import 'package:portfolio_client/services/http_service_Singleton.dart';
import 'package:portfolio_client/widgets/projects_page/desktop/backend_widget.dart';
import 'package:portfolio_client/widgets/projects_page/desktop/card.dart';
import 'package:portfolio_client/widgets/projects_page/desktop/contact_me.dart';
import 'package:portfolio_client/widgets/projects_page/desktop/get_in_touch.dart';
import 'package:portfolio_client/widgets/projects_page/desktop/header_desktop.dart';
import 'package:portfolio_client/widgets/projects_page/desktop/projects.dart';
import 'package:portfolio_client/widgets/projects_page/desktop/skills.dart';
import 'package:portfolio_client/widgets/projects_page/mobile/contact_me.dart';
import 'package:portfolio_client/widgets/projects_page/mobile/drawerContent.dart';
import 'package:portfolio_client/widgets/projects_page/mobile/header_mobile.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectsPage extends StatefulWidget {
  ProjectsPage({super.key, required this.http_service});

  final HttpService http_service;

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  late Future<List<ProjectModel>> projects_data;

  //todo : navbar scroll :
  final scroll_controller = ScrollController();

  List<GlobalKey> navbarkeys = List.generate(4, (index) => GlobalKey());
  // todo : passable scroll function :
  void onTapScroller(int index, List<GlobalKey> keys) {
    Scrollable.ensureVisible(keys[index].currentContext!,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  //todo : for the mobile drawer :
  final scaffoldkey = GlobalKey<ScaffoldState>();

  void openDrawer(GlobalKey<ScaffoldState> scaffoldkey) {
    scaffoldkey.currentState?.openEndDrawer();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    projects_data = widget.http_service.get_projects();
  }

  @override
  Widget build(BuildContext context) {
    ;
    // Get the MediaQuery data from the context
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Get the size of the screen
    Size screenSize = mediaQuery.size;

    var screenwidth = screenSize.width;
    var screenheight = screenSize.width;

    debugPrint("screen width ${screenwidth}");

    return LayoutBuilder(builder: (context, Constraints) {
      return Scaffold(
        key: scaffoldkey,
        endDrawer: Drawer(
          backgroundColor: Color(0xff222831),
          child: DrawerContent(onTapScroller: onTapScroller, keys: navbarkeys),
        ),
        body: SingleChildScrollView(
          controller: scroll_controller,
          scrollDirection: Axis.vertical,
          child: Column(
            // scrollDirection: Axis.vertical,
            children: [
              //! header
              // todo : for scroll
              SizedBox(
                key: navbarkeys.first,
              ),
              if (Constraints.maxWidth <= 700.0)
                HeaderMobile(
                  openDrawer: () {
                    openDrawer(scaffoldkey);
                  },
                )
              else
                HeaderDesktop(
                  onTapScroller: onTapScroller,
                  keys: navbarkeys,
                ),

              //! Contact me Section :

              if (Constraints.maxWidth <= 700.0)
                ContactMeMobile(
                  screenwidth: screenwidth,
                  onTapScroller: onTapScroller,
                  keys: navbarkeys,
                )
              else
                ContactMeDesktop(
                  screenwidth: screenwidth,
                  onTapScroller: onTapScroller,
                  keys: navbarkeys,
                ),

              //! what i can do section - skills  :
              SizedBox(
                key: navbarkeys[1],
              ),
              // todo : in a row to solve the flex problem
              Row(
                children: [
                  SkillsDesktopMobile(
                    screenwidth: screenwidth,
                  ),
                ],
              ),

              //! Projects Section --
              SizedBox(
                key: navbarkeys[2],
              ),
              // todo : in a row to solve the expanded problem
              Row(
                children: [
                  FutureBuilder(
                    future: projects_data,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }

                      // todo : API data is ready and valid
                      final projects = snapshot.data!;
                      return ProjectsDesktopMobile(
                        projects: projects,
                      );
                    },
                  ),
                ],
              ),

              //! Get in touch Section :
              SizedBox(
                key: navbarkeys[3],
              ),
              GetInTouch(),
            ],
          ),
        ),
      );
    });
  }
}
