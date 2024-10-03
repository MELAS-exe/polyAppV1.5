import 'package:flutter/material.dart';
import 'package:polyapp/pages/competition/matchs_a_venir_item.dart';
import 'package:polyapp/util/constante.dart';

class MatchsAVenir extends StatefulWidget {
  const MatchsAVenir({super.key});

  @override
  State<MatchsAVenir> createState() => _MatchsAVenirState();
}

class _MatchsAVenirState extends State<MatchsAVenir> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/1.1,
      height: 170,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
        color: eptOrange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            MatchsAVenirItem(
              date: "Mardi 3 Juin",
            ),
            MatchsAVenirItem(
              date: "Mardi 3 Juin",
            ),
            MatchsAVenirItem(
              date: "Mardi 3 Juin",
            ),
            MatchsAVenirItem(
              date: "Mardi 3 Juin",
            ),
            MatchsAVenirItem(
              date: "Mardi 3 Juin",
            ),
          ],
        ),
      ),
    );
  }
}