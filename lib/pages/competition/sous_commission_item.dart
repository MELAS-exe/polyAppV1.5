import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SousCommissionItem extends StatelessWidget {
  final Image image;
  Widget? child;
  SousCommissionItem({super.key, required this.image, this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (child != null) {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => child!));
        }
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
        width: 80,
        height: 80,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        clipBehavior: Clip.hardEdge,
        child: image,
      ),
    );
  }
}
