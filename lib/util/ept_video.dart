import 'package:flutter/material.dart';
import 'package:polyapp/util/constante.dart';

class EptVideo extends StatelessWidget {
  double width;
  double height;
  Image? image;
  String? title;
  bool invertColors;

  EptVideo({
    super.key,
    this.image,
    this.title,
    this.invertColors = false,
    required this.width,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color:invertColors? eptLightGrey:eptDarkGrey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Image.asset("assets/Homepage/icons8-jouer-light-grey-90.png", scale: 4, color: invertColors? eptDarkGrey: eptLightGrey,),
          ),
        )
      ],
    );
  }
}
