import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio_client/models/project_model.dart';

import 'card-preview900.dart';
import 'dart:js' as js;

class FooterDesktop900 extends StatelessWidget {
  FooterDesktop900({super.key, required this.project});

  ProjectModel project;

  @override
  Widget build(BuildContext context) {
    // Get the MediaQuery data from the context
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Get the size of the screen
    Size screenSize = mediaQuery.size;

    var screenwidth = screenSize.width;
    var screenheight = screenSize.width;

    return Container(
      height: 700,
      decoration: BoxDecoration(color: Color(0xff222831)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //! image :
          Container(
              height: 700,
              child: Container(
                  child: MyCardPreview900.MyCardPreview900(
                screenwidth: screenwidth,
                image: project.thumnail,
                cover: true,
              ))),

          //! For more details - download  - nginx
          Container(
              height: 500,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Wrap(
                      children: [
                        Text(
                          "For more details download the system design\n document .pdf",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    // ! Download button :
                    Container(
                      width: screenwidth / 3,
                      child: ElevatedButton(
                          onPressed: () {
                            js.context
                                .callMethod('open', [project.system_design]);
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xffFFCC99))),
                          child: ListTile(
                            leading: Icon(
                              Icons.download,
                              color: Color(0xff444444),
                            ),
                            title: Center(
                              child: Text(
                                "Design Document",
                                style: TextStyle(
                                    color: Color(0xff444444),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
