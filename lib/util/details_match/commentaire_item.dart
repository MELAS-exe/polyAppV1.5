import 'package:flutter/material.dart';
import 'package:polyapp/util/constante.dart';

class CommentaireItem extends StatelessWidget {
  Image? image;
  String? name;
  String? date;
  String? content;

  CommentaireItem({super.key, this.image, this.name, this.date, this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
            color: eptLighterOrange, borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
              clipBehavior: Clip.hardEdge,
              child: image ?? const SizedBox(),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name ?? "name",
                        style: const TextStyle(
                            fontFamily: "Inter",
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "il y a $date",
                        style: const TextStyle(color: eptOrange, fontSize: 14),
                      ),
                    ],
                  ),
                  RichText(
                      text: TextSpan(
                          text: content,
                          style: const TextStyle(
                              fontFamily: "InterLight",
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Colors.black)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
