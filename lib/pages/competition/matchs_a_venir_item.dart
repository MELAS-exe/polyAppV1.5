import 'package:flutter/material.dart';
import 'package:polyapp/util/constante.dart';
import 'package:polyapp/util/infocard.dart';

class MatchsAVenirItem extends StatelessWidget {
  String? date;
  Image? image;
  Widget? child;

  MatchsAVenirItem({super.key, this.date, this.image, this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InfoCard(
          width: 90,
          height: 120,
          image: image,
          widget: child,
          color: eptLightGrey,
          borderRadius: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        if (date != null) ...[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                date!,
                style: const TextStyle(
                    fontFamily: "InterMedium",
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 20,
              )
            ],
          )
        ]
      ],
    );
  }
}
