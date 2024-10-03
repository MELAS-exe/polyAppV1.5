import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polyapp/util/club_util/club_bureau.dart';
import 'package:polyapp/util/club_util/club_person.dart';
import 'package:polyapp/util/club_util/club_top_shape.dart';
import 'package:polyapp/util/club_util/gerer_club_skeleton/gerer_club.dart';
import 'package:polyapp/util/club_util/matchs_list.dart';
import 'package:polyapp/util/club_util/prochain_evenement.dart';
import 'package:polyapp/util/constante.dart';
import 'package:polyapp/util/ept_back_button.dart';
import 'package:polyapp/util/ept_button.dart';
import 'package:polyapp/util/ept_video.dart';
import 'package:polyapp/util/game_resume_tile.dart';

class ClubPageSkeleton extends StatefulWidget {
  Image? clubLogo;
  Image? clubBackground;
  List<Membres>? listeMembres;
  List<GameResumeTile>? listeMatchs;
  String? clubName;

  ClubPageSkeleton(
      {super.key,
      this.clubName,
      this.clubLogo,
      this.clubBackground,
      this.listeMembres,
      this.listeMatchs});

  @override
  State<ClubPageSkeleton> createState() => _ClubPageSkeletonState();
}

class _ClubPageSkeletonState extends State<ClubPageSkeleton> {
  bool isAdmin = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                CustomClippedImage(
                  child: Stack(
                    children: [
                      if (widget.clubBackground != null) ...[
                        widget.clubBackground!
                      ],
                      Opacity(
                        opacity: 0.5,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          color: eptOrange,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: -80,
                  child: SizedBox(
                      width: 100,
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: eptLightGrey
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: widget.clubLogo ?? const SizedBox(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.clubName ?? "Club Name",
                            style: const TextStyle(fontSize: 14),
                          )
                        ],
                      )),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: EptBackButton(
                    color: Colors.white,
                  ),
                ),
                if (isAdmin) ...[
                  Positioned(
                      bottom: 70,
                      child: EptButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => GererClub(image: widget.clubLogo, title: widget.clubName)));
                        },
                        title: "Gérer",
                        width: 100,
                        height: 35,
                        borderRadius: 5,
                      ))
                ]
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Text("Bureau"),
                if (isAdmin) ...[
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/page-gestion-club/plus.png",
                      scale: 5,
                    ),
                  )
                ]
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ClubBureau(
              listeMembres: widget.listeMembres,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Text("Prochain évènement"),
                if (isAdmin) ...[
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/page-gestion-club/edit_cal.png",
                      scale: 5,
                    ),
                  )
                ]
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const ProchainEvenement(),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Text("Matchs"),
                if (isAdmin) ...[
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/page-gestion-club/plus.png",
                      scale: 5,
                    ),
                  )
                ]
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MatchsList(
              listeMatchs: widget.listeMatchs,
            )
          ],
        ),
      ),
    ));
  }
}
