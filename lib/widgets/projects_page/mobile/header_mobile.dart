import 'package:flutter/material.dart';

class HeaderMobile extends StatelessWidget {
  HeaderMobile({super.key, required this.openDrawer});

  var openDrawer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Color(0xff222831),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "ILYAS",
            style: TextStyle(
              color: Color(0xff5DEBD7),
              fontSize: 36,
            ),
          ),
          InkWell(
            onTap: openDrawer,
            child: Icon(
              Icons.menu_rounded,
              size: 48,
            ),
          )
        ],
      ),
    );
  }
}

/*    Text(
                "home",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ), */
/*             SizedBox(
                width: 16,
              ),
              Text(
                "skill",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "projects",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "contacts",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 16,
              ), */
//    ],
