import 'package:flutter/material.dart';

class HeaderDesktop extends StatelessWidget {
  HeaderDesktop({super.key, required this.onTapScroller, required this.keys});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  onTapScroller(0, keys);
                },
                child: Text(
                  "home",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              InkWell(
                onTap: () {
                  onTapScroller(1, keys);
                },
                child: Text(
                  "skills",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              InkWell(
                onTap: () {
                  onTapScroller(2, keys);
                },
                child: Text(
                  "projects",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              InkWell(
                onTap: () {
                  onTapScroller(3, keys);
                },
                child: Text(
                  "contacts",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
            ],
          )
        ],
      ),
    );
  }
}
