import 'package:flutter/material.dart';
import 'package:polyapp/util/constante.dart';

class BlogVideo extends StatelessWidget {
  final Image image;
  final String title;
  const BlogVideo({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipOval(child: Container(
              width: 40, 
              height: 40, 
              child: image
              )),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            )
          ],
        ),
        SizedBox(height: 10,),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
            color: eptDarkGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Image.asset("assets/Homepage/icons8-jouer-light-grey-90.png", scale: 4,),
          ),
        )
      ],
    );
  }
}
