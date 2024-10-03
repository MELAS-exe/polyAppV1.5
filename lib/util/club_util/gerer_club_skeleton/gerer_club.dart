import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polyapp/util/club_util/gerer_club_skeleton/logo_club_edit.dart';
import 'package:polyapp/util/club_util/gerer_club_skeleton/match_add.dart';
import 'package:polyapp/util/club_util/gerer_club_skeleton/match_edit.dart';
import 'package:polyapp/util/club_util/gerer_club_skeleton/prochain_evenement_add.dart';
import 'package:polyapp/util/club_util/gerer_club_skeleton/prochain_evenement_edit.dart';
import 'package:polyapp/util/club_util/matchs_list.dart';
import 'package:polyapp/util/ept_back_button.dart';
import 'package:polyapp/util/game_resume_tile.dart';

class GererClub extends StatefulWidget {
  Image? image;
  String? title;
  GererClub({super.key, this.image, this.title});

  @override
  State<GererClub> createState() => _GererClubState();
}

class _GererClubState extends State<GererClub> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                EptBackButton(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            LogoClubEdit(
              image: widget.image,
              title: widget.title,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              height: 2,
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "Prochain évènement",
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ProchainEvenementAdd()));
                    },
                    child: Image.asset(
                      "assets/plus2.png",
                      scale: 4,
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ProchainEvenementEdit(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Text("Matchs"),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const MatchAdd()));
                  },
                  child: Image.asset(
                    "assets/plus2.png",
                    scale: 4,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            MatchsEdit(
              listeMatchs: listeMatchs,
            )
          ],
        ),
      ),
    ));
  }
}

List<GameResumeTile>? listeMatchs = [
  GameResumeTile(
    date: "Mercredi 5 Juin",
    team1: Image.asset("assets/Competition/logo_50.png"),
    score1: 100,
    classe1: "DIC1",
    team2: Image.asset("assets/Competition/logo_50.png"),
    score2: 150,
    classe2: "TC2",
  ),
  GameResumeTile(
    date: "Mercredi 5 Juin",
    team1: Image.asset("assets/Competition/logo_50.png"),
    score1: 100,
    classe1: "DIC1",
    team2: Image.asset("assets/Competition/logo_50.png"),
    score2: 150,
    classe2: "TC2",
  ),
  GameResumeTile(
    date: "Mercredi 5 Juin",
    team1: Image.asset("assets/Competition/logo_50.png"),
    score1: 100,
    classe1: "DIC1",
    team2: Image.asset("assets/Competition/logo_50.png"),
    score2: 150,
    classe2: "TC2",
  ),
  GameResumeTile(
    date: "Mercredi 5 Juin",
    team1: Image.asset("assets/Competition/logo_50.png"),
    score1: 100,
    classe1: "DIC1",
    team2: Image.asset("assets/Competition/logo_50.png"),
    score2: 150,
    classe2: "TC2",
  ),
  GameResumeTile(
    date: "Mercredi 5 Juin",
    team1: Image.asset("assets/Competition/logo_50.png"),
    score1: 100,
    classe1: "DIC1",
    team2: Image.asset("assets/Competition/logo_50.png"),
    score2: 150,
    classe2: "TC2",
  ),
  GameResumeTile(
    date: "Mercredi 5 Juin",
    team1: Image.asset("assets/Competition/logo_50.png"),
    score1: 100,
    classe1: "DIC1",
    team2: Image.asset("assets/Competition/logo_50.png"),
    score2: 150,
    classe2: "TC2",
  ),
  GameResumeTile(
    date: "Mercredi 5 Juin",
    team1: Image.asset("assets/Competition/logo_50.png"),
    score1: 100,
    classe1: "DIC1",
    team2: Image.asset("assets/Competition/logo_50.png"),
    score2: 150,
    classe2: "TC2",
  ),
  GameResumeTile(
    date: "Mercredi 5 Juin",
    team1: Image.asset("assets/Competition/logo_50.png"),
    score1: 100,
    classe1: "DIC1",
    team2: Image.asset("assets/Competition/logo_50.png"),
    score2: 150,
    classe2: "TC2",
  ),
  GameResumeTile(
    date: "Mercredi 5 Juin",
    team1: Image.asset("assets/Competition/logo_50.png"),
    score1: 100,
    classe1: "DIC1",
    team2: Image.asset("assets/Competition/logo_50.png"),
    score2: 150,
    classe2: "TC2",
  ),
  GameResumeTile(
    date: "Mercredi 5 Juin",
    team1: Image.asset("assets/Competition/logo_50.png"),
    score1: 100,
    classe1: "DIC1",
    team2: Image.asset("assets/Competition/logo_50.png"),
    score2: 150,
    classe2: "TC2",
  ),
  GameResumeTile(
    date: "Mercredi 5 Juin",
    team1: Image.asset("assets/Competition/logo_50.png"),
    score1: 100,
    classe1: "DIC1",
    team2: Image.asset("assets/Competition/logo_50.png"),
    score2: 150,
    classe2: "TC2",
  ),
  GameResumeTile(
    date: "Mercredi 5 Juin",
    team1: Image.asset("assets/Competition/logo_50.png"),
    score1: 100,
    classe1: "DIC1",
    team2: Image.asset("assets/Competition/logo_50.png"),
    score2: 150,
    classe2: "TC2",
  ),
  GameResumeTile(
    date: "Mercredi 5 Juin",
    team1: Image.asset("assets/Competition/logo_50.png"),
    score1: 100,
    classe1: "DIC1",
    team2: Image.asset("assets/Competition/logo_50.png"),
    score2: 150,
    classe2: "TC2",
  ),
  GameResumeTile(
    date: "Mercredi 5 Juin",
    team1: Image.asset("assets/Competition/logo_50.png"),
    score1: 100,
    classe1: "DIC1",
    team2: Image.asset("assets/Competition/logo_50.png"),
    score2: 150,
    classe2: "TC2",
  ),
  GameResumeTile(
    date: "Mercredi 5 Juin",
    team1: Image.asset("assets/Competition/logo_50.png"),
    score1: 100,
    classe1: "DIC1",
    team2: Image.asset("assets/Competition/logo_50.png"),
    score2: 150,
    classe2: "TC2",
  ),
  GameResumeTile(
    date: "Mercredi 5 Juin",
    team1: Image.asset("assets/Competition/logo_50.png"),
    score1: 100,
    classe1: "DIC1",
    team2: Image.asset("assets/Competition/logo_50.png"),
    score2: 150,
    classe2: "TC2",
  ),
  GameResumeTile(
    date: "Mercredi 5 Juin",
    team1: Image.asset("assets/Competition/logo_50.png"),
    score1: 100,
    classe1: "DIC1",
    team2: Image.asset("assets/Competition/logo_50.png"),
    score2: 150,
    classe2: "TC2",
  ),
  GameResumeTile(
    date: "Mercredi 5 Juin",
    team1: Image.asset("assets/Competition/logo_50.png"),
    score1: 100,
    classe1: "DIC1",
    team2: Image.asset("assets/Competition/logo_50.png"),
    score2: 150,
    classe2: "TC2",
  ),
  GameResumeTile(
    date: "Mercredi 5 Juin",
    team1: Image.asset("assets/Competition/logo_50.png"),
    score1: 100,
    classe1: "DIC1",
    team2: Image.asset("assets/Competition/logo_50.png"),
    score2: 150,
    classe2: "TC2",
  ),
];
