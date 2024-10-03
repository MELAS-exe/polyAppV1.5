import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String imagePath;
  final title;
  Function onTap;
  bool isLink;
  DrawerItem(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.onTap,
      this.isLink = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      color: Colors.white,
      width: 250,
      height: 40,
      child: Row(
        children: [
          Image.asset(
            imagePath,
            scale: 4,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: const TextStyle(fontFamily: "Inter", fontSize: 12),
          ),
          if (isLink) ...[
            Spacer(),
            Image.asset("assets/top-left-menu/external-link.png", scale: 4,)]
        ],
      ),
    );
  }
}
