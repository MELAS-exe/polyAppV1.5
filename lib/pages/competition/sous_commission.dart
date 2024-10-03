import 'package:flutter/material.dart';
import 'package:polyapp/pages/competition/sous_commission_item.dart';
import 'package:polyapp/util/club_util/club_page_skeleton.dart';
import 'package:polyapp/util/club_util/club_person.dart';
import 'package:polyapp/util/details_match/details_match.dart';
import 'package:polyapp/util/game_resume_tile.dart';

class SousCommission extends StatefulWidget {
  const SousCommission({super.key});

  @override
  State<SousCommission> createState() => _SousCommissionState();
}

class _SousCommissionState extends State<SousCommission> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 10,
        ),
        ...[
          SousCommissionItem(
            image: Image.asset("assets/Competition/logo_jeux_esprit.png"),
            child: ClubPageSkeleton(
              listeMembres: [
                Membres(title: "Président"),
                Membres(title: "Vice-président")
              ],
              listeMatchs: listeMatchs,
              clubBackground: Image.asset(
                "assets/jeux-desprit/jeux_esprit_background.jpg",
                fit: BoxFit.cover,
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),
              clubLogo: Image.asset("assets/jeux-desprit/logo_jeux_esprit.png", fit: BoxFit.contain,),
              clubName: "Jeux d'esprit",
            ),
          ),
          SousCommissionItem(
              image: Image.asset("assets/Competition/logo_volleyball.png")),
          SousCommissionItem(
              image: Image.asset("assets/Competition/logo_jeux_esprit.png")),
          SousCommissionItem(
              image: Image.asset("assets/Competition/logo_jeux_esprit.png")),
          SousCommissionItem(
              image: Image.asset("assets/Competition/logo_jeux_esprit.png")),
          SousCommissionItem(
              image: Image.asset("assets/Competition/logo_jeux_esprit.png")),
          SousCommissionItem(
              image: Image.asset("assets/Competition/logo_jeux_esprit.png")),
        ],
        const SizedBox(
          width: 10,
        ),
      ],
    );
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
    child: DetailsMatch(),
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
