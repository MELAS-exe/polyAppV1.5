import 'package:flutter/material.dart';
import 'package:polyapp/util/constante.dart';

class InfoCard extends StatelessWidget {
  Image? image;
  Widget? widget;
  double width;
  double height;
  double? borderRadius;
  Color? color;

  InfoCard(
      {super.key,
      this.color,
      this.image,
      this.widget,
      required this.width,
      required this.height,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      padding: const EdgeInsets.all(3),
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color ?? eptOrange,
          borderRadius: borderRadius != null
              ? BorderRadius.circular(borderRadius!)
              : BorderRadius.zero),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: borderRadius != null
                ? BorderRadius.circular(borderRadius!)
                : BorderRadius.zero),
        clipBehavior: Clip.hardEdge,
        child: image != null ? image! : Image.asset("assets/no-image.png"),
      ),
    );
  }
}
