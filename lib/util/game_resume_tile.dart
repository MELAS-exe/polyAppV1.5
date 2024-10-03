import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polyapp/util/constante.dart';

class GameResumeTile extends StatelessWidget {
  String? title;
  String? date;
  String? classe1;
  Image? team1;
  int? score1;
  String? classe2;
  Image? team2;
  int? score2;
  String? subtitle;
  Widget? child;

  GameResumeTile(
      {super.key,
      this.title,
      this.date,
      this.team1,
      this.score1,
      this.team2,
      this.score2,
      this.subtitle,
      this.classe1,
      this.classe2,
      this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (child != null) {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => child!));
        }
      },
      child: Column(
        children: [
          if (title != null) ...[
            Row(
              children: [
                const SizedBox(
                  width: 40,
                ),
                Text(
                  title!,
                  style: const TextStyle(
                      fontFamily: "InterLight",
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                width: MediaQuery.of(context).size.width / 1.2,
                height: 105,
                decoration: BoxDecoration(
                    color: eptLightGrey,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    if (date != null) ...[
                      Text(
                        date!,
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child:
                                  team1 ?? Image.asset("assets/no-image.png"),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "$classe1: ${score1!}",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "InterMedium",
                                fontWeight: FontWeight.bold,
                                color: score1! >= score2! ? eptGreen : eptRed,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "$classe2: ${score2!}",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "InterMedium",
                                fontWeight: FontWeight.bold,
                                color: score1! <= score2! ? eptGreen : eptRed,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child:
                                  team2 ?? Image.asset("assets/no-image.png"),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (subtitle != null) ...[
                      Text(
                        subtitle!,
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  ],
                ),
              ),
              Container(
                width: 30,
                height: 2,
                color: Colors.black,
              )
            ],
          ),
        ],
      ),
    );
  }
}
