import 'package:flutter/material.dart';

class DrawerContent extends StatelessWidget {
  DrawerContent({super.key, required this.onTapScroller, required this.keys});

  Function onTapScroller;
  List<GlobalKey> keys;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xff222831),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          InkWell(
              onTap: () {
                onTapScroller(0, keys);
              },
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  "home",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
          InkWell(
              onTap: () {
                onTapScroller(1, keys);
              },
              child: ListTile(
                leading: Icon(Icons.code),
                title: Text(
                  "skills",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
          InkWell(
              onTap: () {
                onTapScroller(2, keys);
              },
              child: ListTile(
                leading: Icon(Icons.folder),
                title: Text(
                  "projects",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
          InkWell(
            onTap: () {
              onTapScroller(3, keys);
            },
            child: ListTile(
              leading: Icon(Icons.mail),
              title: Text(
                "contacts",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
