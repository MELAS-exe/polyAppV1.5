import 'package:flutter/material.dart';
import 'package:polyapp/pages/homepage/blog/blog_video.dart';
import 'package:polyapp/util/constante.dart';

class Blog extends StatefulWidget {
  const Blog({super.key});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Blog",
          style: TextStyle(
              fontFamily: "Inter", fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: 500,
          decoration: BoxDecoration(
              color: eptLightGrey, borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            BlogVideo(
                image: Image.asset("assets/Competition/logo_jeux_esprit.png"),
                title: "Interview d'avant match"),
            ...[
              Spacer(),
              const Text("Vous avez atteind le fond...",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 14))
            ]
          ]),
        )
      ],
    );
  }
}
