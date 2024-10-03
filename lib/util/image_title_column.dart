import 'package:flutter/material.dart';

class ImageTitleColumn extends StatelessWidget {
  String icon;
  String title;
  double scale;
  String fontFamily;
  double fontSize;
  FontWeight fontWeight;
  double width;
  double height;

  ImageTitleColumn(
      {super.key,
      this.width = 100,
      this.height = 100,
      required this.icon,
      required this.title,
      this.scale = 1,
      this.fontFamily = "Inter",
      this.fontSize = 16,
      this.fontWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            scale: scale,
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
            textAlign: TextAlign.center,
              text: TextSpan(
            text: title,
            style: TextStyle(
                fontFamily: fontFamily,
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: Colors.black
                ),
          ))
        ],
      ),
    );
  }
}
