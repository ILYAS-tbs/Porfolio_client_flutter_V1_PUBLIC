import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio_client/models/project_model.dart';
import 'package:portfolio_client/widgets/details_page/mobile/card-preview.dart';

import 'dart:js' as js;

class FooterMobile extends StatelessWidget {
  FooterMobile({super.key, required this.project});

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
      decoration: BoxDecoration(color: Color(0xff222831)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //! image :

          Container(
              height: 400,
              constraints: BoxConstraints(maxHeight: 500),
              child: Container(
                child: MyCardMobile(
                  screenwidth: screenwidth,
                  image: project.thumnail,
                  cover: true,
                ),
              )),

          //! For more details - download  - nginx
          Container(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(
                  children: [
                    Container(
                      margin: EdgeInsets.all(16),
                      child: Text(
                        "For more details download the system design document .pdf",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                // ! Download button :
                Container(
                  width: screenwidth * 0.75,
                  child: ElevatedButton(
                      onPressed: () {
                        js.context.callMethod('open', [project.system_design]);
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
                ),

                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
