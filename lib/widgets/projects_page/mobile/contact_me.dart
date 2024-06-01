import 'package:flutter/material.dart';

class ContactMeMobile extends StatelessWidget {
  ContactMeMobile(
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
      height: 1100,
      decoration: BoxDecoration(color: Color(0xff222831)),
      child: Container(
        padding: EdgeInsets.only(left: screenwidth / 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 8,
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(left: 32),
                height: double.infinity,
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
                      width: 300,
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
                            fontSize: 30,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/flutter_bird.png',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
