import 'package:flutter/material.dart';
import 'package:portfolio_client/shared/constants.dart';

class MyCardPreview900 extends StatelessWidget {
  MyCardPreview900.MyCardPreview900(
      {super.key,
      required this.screenwidth,
      required this.image,
      required this.cover});

  var screenwidth;

  bool cover;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(32),
        constraints:
            BoxConstraints(minHeight: 600, maxWidth: screenwidth / 3 - 32),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(32)),
        //width: screenwidth * 0.5,
        child: Image.network(
          "${ServerData.SERVER_URL}/${image}",
          fit: cover ? BoxFit.cover : BoxFit.contain,
        ));
  }
}
