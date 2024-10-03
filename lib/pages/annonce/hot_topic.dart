import 'package:flutter/material.dart';
import 'package:polyapp/pages/annonce/bourses.dart';
import 'package:polyapp/pages/annonce/restauration.dart';
import 'package:polyapp/pages/annonce/rex_row.dart';
import 'package:polyapp/util/constante.dart';

class HotTopic extends StatelessWidget {
  const HotTopic({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAdmin = true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              "Hot-Topics",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Image.asset(
              "assets/polytech-info/logo_adept.jpg",
              scale: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                const Text(
                  "Retour d'expérience",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                if (isAdmin) ...[
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/polytech-info/plus.png",
                        scale: 5,
                      )),
                ]
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Rex(),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: eptOrange, borderRadius: BorderRadius.circular(5)),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Image.asset(
                  "assets/polytech-info/resto.png",
                  scale: 3,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                const Text(
                  "Restauration",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                if (isAdmin) ...[
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/polytech-info/plus.png",
                        scale: 5,
                      )),
                ]
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Restauration(), 
        const SizedBox(
          height: 30,
        ),
                Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: eptOrange, borderRadius: BorderRadius.circular(5)),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Image.asset(
                  "assets/polytech-info/bourses.png",
                  scale: 3,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                const Text(
                  "Bourses",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                if (isAdmin) ...[
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/polytech-info/plus.png",
                        scale: 5,
                      )),
                ]
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        Bourses(),
      ],
    );
  }
}
