import 'package:flutter/material.dart';
import 'package:polyapp/util/game_resume_tile.dart';

class DerniersMatchs extends StatefulWidget {
  const DerniersMatchs({super.key});

  @override
  State<DerniersMatchs> createState() => _DerniersMatchsState();
}

class _DerniersMatchsState extends State<DerniersMatchs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GameResumeTile(
          title: "Génie en herbe",
          date: "Mercredi 5 Juin",
          team1: Image.asset("assets/Competition/logo_50.png"),
          score1: 100,
          team2: Image.asset("assets/Competition/logo_50.png"),
          score2: 110,
          subtitle: "Demi-finale",
          classe1: "TC2",
          classe2: "DIC1",
        ),
        const SizedBox(
          height: 20,
        ),
        GameResumeTile(
          title: "Génie en BasketBall",
          date: "Mercredi 5 Juin",
          score1: 200,
          team2: Image.asset("assets/Competition/logo_50.png"),
          score2: 110,
          subtitle: "Demi-finale",
          classe1: "TC2",
          classe2: "DIC1",
        ),
      ],
    );
  }
}
