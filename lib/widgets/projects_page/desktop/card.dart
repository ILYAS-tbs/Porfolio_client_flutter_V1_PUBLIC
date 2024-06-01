import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_client/models/project_model.dart';
import 'package:portfolio_client/pages/details_page.dart';
import 'package:portfolio_client/services/http_service_Singleton.dart';
import 'package:portfolio_client/shared/constants.dart';

import 'dart:js' as js;

class MyCard extends StatelessWidget {
  MyCard({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final http_service_singleton = HttpService.Instance();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsPage(
                    http_service: http_service_singleton,
                    project_id: project.id,
                  )),
        );
      },
      child: Container(
        //  height: 320,
        constraints: BoxConstraints(minHeight: 320),
        width: 270,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Color(0xff707287), borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Container(
              child:
                  Image.network("${ServerData.SERVER_URL}${project.thumnail}"),
            ),
            // todo : belowe the imgas column of 3 rows - but i have text so : \n
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        project.name,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            project.desc,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "A v a i l a b l e  O n :",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Color(0xff5DEBD7),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              //todo icons :

                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      child: SvgPicture.asset(
                                        'assets/icons/web.svg',
                                        height: 16,
                                        width: 16,
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      child: SvgPicture.asset(
                                        'assets/icons/github.svg',
                                        height: 16,
                                        width: 16,
                                      ),
                                    ),
                                    // Container(
                                    //   padding:
                                    //       EdgeInsets.symmetric(horizontal: 4),
                                    //   child: SvgPicture.asset(
                                    //     'assets/icons/android.svg',
                                    //     height: 16,
                                    //     width: 16,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
