import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackendWidgetDesktop extends StatelessWidget {
  BackendWidgetDesktop(
      {super.key,
      required this.svg_path,
      required this.text,
      required this.screenwidth});

  String text;
  String svg_path;

  var screenwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      //     height: 144,
      width: screenwidth / 2,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Color(0xff707287), borderRadius: BorderRadius.circular(8)),
      child: Wrap(
        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            svg_path,
            height: 128,
            width: 128,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
