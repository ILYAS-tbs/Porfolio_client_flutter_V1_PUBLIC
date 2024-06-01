import 'package:flutter/material.dart';
import 'package:portfolio_client/models/project_model.dart';
import 'package:portfolio_client/widgets/details_page/desktop_900/card-preview900.dart';

class CardListDesktop900 extends StatelessWidget {
  CardListDesktop900(
      {super.key, required this.screenwidth, required this.project});

  var screenwidth;

  List<String> getImages() {
    List<String> images = [];
    var image;
    debugPrint('here');
    for (int i = 0; i < project.image_set.length; i++) {
      image = project.image_set[i].img;
      images.add(image);
    }

    return images;
  }

  ProjectModel project;
  @override
  Widget build(BuildContext context) {
    List<String> my_images = getImages();

    return Container(
      height: 600,
      decoration: BoxDecoration(color: Color(0xff222831)),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < my_images.length; i++)
            MyCardPreview900.MyCardPreview900(
              screenwidth: screenwidth,
              image: my_images[i],
              cover: false,
            ),
        ],
      ),
    );
  }
}

// todo  : MD = mobile Desktop ... works on both responsivelly