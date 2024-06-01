import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'dart:js' as js;

class GetInTouch extends StatelessWidget {
  GetInTouch({super.key});

  List<Map<String, dynamic>> contacts_needchange = [
    {
      "logo_and_link": [
        'assets/icons/github.svg',
        'https://github.com/ILYAS-tbs'
      ],
      "changeColor": true
    },
    {
      "logo_and_link": [
        'assets/icons/linkdin.svg',
        'https://www.linkedin.com/in/ilyas-tbs-2b211a249/'
      ],
      "changeColor": false
    },
    {
      "logo_and_link": [
        'assets/icons/instagram.svg',
        'https://www.instagram.com/cs_alchemy?igsh=a25qbmZnbzE5bW5q'
      ],
      "changeColor": true
    },
    {
      "logo_and_link": [
        'assets/icons/facebook.svg',
        'https://www.facebook.com/profile.php?id=61556435854523&mibextid=ZbWKwL'
      ],
      "changeColor": true
    },
    // {
    //   "logo_and_link": [
    //     'assets/icons/gmail.svg',
    //     'ilyas.tabennhas.tbs@gmail.com'
    //   ],
    //   "changeColor": false
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.only(top: 16, bottom: 8),
      decoration: BoxDecoration(color: Color(0xff404258)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Get in touch",
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (int i = 0; i < contacts_needchange.length; i++)
                    if (contacts_needchange[i]['changeColor'])
                      InkWell(
                        onTap: () {
                          js.context.callMethod('open',
                              [contacts_needchange[i]['logo_and_link'][1]]);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: SvgPicture.asset(
                            contacts_needchange[i]['logo_and_link'][0],
                            color: Colors.white,
                            height: 32,
                            width: 32,
                          ),
                        ),
                      )
                    else
                      InkWell(
                        onTap: () {
                          js.context.callMethod('open',
                              [contacts_needchange[i]['logo_and_link'][1]]);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: SvgPicture.asset(
                            contacts_needchange[i]['logo_and_link'][0],
                            height: 32,
                            width: 32,
                          ),
                        ),
                      )
                ]),
          ),
          SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
