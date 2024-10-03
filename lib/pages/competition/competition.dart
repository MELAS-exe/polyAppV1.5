import 'package:flutter/material.dart';
import 'package:polyapp/pages/annonce/p_info_nouveaute.dart';
import 'package:polyapp/pages/competition/derniers_matchs.dart';
import 'package:polyapp/pages/competition/matchs_a_venir.dart';
import 'package:polyapp/pages/competition/sous_commission.dart';
import 'package:polyapp/pages/competition/sous_commission_item.dart';
import 'package:polyapp/util/constante.dart';
import 'package:polyapp/util/game_resume_tile.dart';

class Competition extends StatelessWidget {
  const Competition({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/Competition/competition_top.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const Positioned(
                    top: 40,
                    child: Text(
                      "Interclasses",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                          fontSize: 35),
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Sous-Commissions",
                  style: TextStyle(fontFamily: "Inter", fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 110,
              color: eptLightGrey,
              child: const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SousCommission(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              height: 2,
              color: Colors.black,
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Derniers matchs",
                  style: TextStyle(fontFamily: "Inter", fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const DerniersMatchs(),
            const SizedBox(
              height: 40,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Matchs à venir",
                  style: TextStyle(fontFamily: "Inter", fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const MatchsAVenir(),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    ));
  }
}
