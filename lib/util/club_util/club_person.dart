import 'package:flutter/material.dart';
import 'package:polyapp/util/constante.dart';

class Membres extends StatelessWidget {
  Image? image;
  String title;
  Membres({super.key, this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: eptLightGrey,
          ),
          clipBehavior: Clip.hardEdge,
          child: image ?? Container(),
        ),
        SizedBox(height: 10,),
        Text(title, style: TextStyle(fontFamily: "InterLight", fontSize: 14, fontWeight: FontWeight.bold),)

      ],
    );
  }
}
