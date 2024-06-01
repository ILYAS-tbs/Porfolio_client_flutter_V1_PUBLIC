import 'package:flutter/material.dart';

class ContactMeDesktop extends StatelessWidget {
  ContactMeDesktop(
      {super.key,
      required this.screenwidth,
      required this.onTapScroller,
      required this.keys});

  var screenwidth;

  final onTapScroller;
  final keys;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      decoration: BoxDecoration(color: Color(0xff222831)),
      child: Container(
        padding: EdgeInsets.only(left: screenwidth / 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hi,\ni’m ILYAS TBS\nA django and Flutter Developer',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      height: 60,
                      width: 400,
                      child: ElevatedButton(
                        onPressed: () {
                          onTapScroller(3, keys);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xffFF204E),
                            ),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Color(0xffFFFFFF))),
                        child: Text(
                          'Contact me',
                          style: TextStyle(
                            fontSize: (screenwidth <= 800) ? 20 : 30,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/flutter_bird.png',
                    // height: 450,
                    width: 800,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
