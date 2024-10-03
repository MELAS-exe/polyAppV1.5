import 'package:flutter/material.dart';

class EptBackButton extends StatelessWidget {
  Color? color;
  EptBackButton({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Image.asset(
        "assets/icons8-flèche-gauche-90.png",
        scale: 3,
        color: color ?? Colors.black,
      ),
    );
  }
}
