import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_client/models/project_model.dart';
import 'package:portfolio_client/services/http_service_Singleton.dart';
import 'package:portfolio_client/widgets/details_page/desktop_900/card-preview900.dart';
import 'package:portfolio_client/widgets/details_page/desktop_900/card_list_900.dart';
import 'package:portfolio_client/widgets/details_page/desktop_900/footer_900.dart';
import 'package:portfolio_client/widgets/details_page/desktop_900/img_software_section.dart';
import 'package:portfolio_client/widgets/details_page/mobile/card-preview.dart';
import 'package:portfolio_client/widgets/details_page/mobile/card_list.dart';
import 'package:portfolio_client/widgets/details_page/mobile/footer_mobile.dart';
import 'package:portfolio_client/widgets/details_page/mobile/img_software_section.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage(
      {super.key, required this.http_service, required this.project_id});

  final HttpService http_service;

  int project_id;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late Future<ProjectModel> project_data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    project_data = widget.http_service.getProject(widget.project_id);
  }

  @override
  Widget build(BuildContext context) {
    // Get the MediaQuery data from the context
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Get the size of the screen
    Size screenSize = mediaQuery.size;

    var screenwidth = screenSize.width;
    var screenheight = screenSize.width;

    double factor = 0.03;

    debugPrint("screen width : ${screenwidth}");

    debugPrint("screen heigth : ${screenheight}");
    //   debugPrint(" screen width ${factor} : ${screenwidth * factor}");

    return LayoutBuilder(builder: (context, constraints) {
      return FutureBuilder(
        future: project_data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          // todo : here is a successful response

          var project = snapshot.data!;
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  project.name,
                  style: TextStyle(
                    color: Color(0xff5DEBD7),
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  //! Project image and software overview section :
                  //
                  //

                  if (constraints.maxWidth <= 900)
                    ImageAndSoftwareMobile(
                      screenwidth: screenwidth,
                      project: project,
                    )
                  else
                    ImageAndSoftwareDesktop900(
                      screenwidth: screenwidth,
                      project: project,
                    ),

                  // ! gallery images part  ;
                  //

                  //
                  if (constraints.maxWidth <= 900)
                    CardListMobile(
                      screenwidth: screenwidth,
                      project: project,
                    )
                  else
                    CardListDesktop900(
                      screenwidth: screenwidth,
                      project: project,
                    ),

                  // ! preview - end sections -- Second page's FOOTER
                  Container(
                      decoration: BoxDecoration(color: Color(0xff222831)),
                      alignment: Alignment.center,
                      child: Text(
                        "Preview",
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      )),

                  if (constraints.maxWidth <= 900)
                    FooterMobile(
                      project: project,
                    )
                  else
                    FooterDesktop900(
                      project: project,
                    )
                ],
              ));
          ;
        },
      );
    });
  }
}


/* 
Scaffold(
          appBar: AppBar(
            title: Text(
              "PORTFOLIOOOO",
              style: TextStyle(
                color: Color(0xff5DEBD7),
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              //! Project image and software overview section :
              //
              //

              if (constraints.maxWidth <= 900)
                ImageAndSoftwareMobile(screenwidth: screenwidth)
              else
                ImageAndSoftwareDesktop900(screenwidth: screenwidth),

              // ! gallery images part  ;
              //

              //
              if (constraints.maxWidth <= 900)
                CardListMobile(screenwidth: screenwidth)
              else
                CardListDesktop900(screenwidth: screenwidth),

              // ! preview - end sections -- Second page's FOOTER
              Container(
                  decoration: BoxDecoration(color: Color(0xff222831)),
                  alignment: Alignment.center,
                  child: Text(
                    "Preview",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  )),

              if (constraints.maxWidth <= 900)
                FooterMobile()
              else
                FooterDesktop900()
            ],
          ));
           */