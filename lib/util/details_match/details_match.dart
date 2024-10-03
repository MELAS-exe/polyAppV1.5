import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polyapp/util/club_util/gerer_club_skeleton/scorers.dart';
import 'package:polyapp/util/constante.dart';
import 'package:polyapp/util/details_match/commentaire_item.dart';
import 'package:polyapp/util/ept_back_button.dart';
import 'package:polyapp/util/ept_button.dart';
import 'package:polyapp/util/image_title_column.dart';

class DetailsMatch extends StatelessWidget {
  const DetailsMatch({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  color: eptLightOrange,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const Text("Détails du match",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: eptLightGrey),
                                    clipBehavior: Clip.hardEdge,
                                    child: Image.asset("assets/Competition/logo_50.png"),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("#47", style: TextStyle(fontSize: 30),),
                            ],
                          ),
                          const Text(
                            "VS",
                            style: TextStyle(fontSize: 18),
                          ),
                          Column(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: eptLightGrey),
                                    clipBehavior: Clip.hardEdge,
                                    child: Image.asset("assets/Competition/logo_50.png"),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("#50", style: TextStyle(fontSize: 30),)
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: 300,
                        height: 70,
                        decoration: BoxDecoration(
                            color: eptOrange,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "30",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                              ],
                            ),
                            Text(
                              "-",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                Text(
                                  "70",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(left: 20, top: 20, child: EptBackButton())
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Statistique",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    ImageTitleColumn(
                      icon: "assets/details-match/main.png",
                      title: "bonnes réponses",
                      fontFamily: "InterMedium",
                      fontSize: 14,
                      scale: 2,
                    ),
                    SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // RectangleNumber(controller: controller,), 
                        Container(
                          color: eptOrange,
                          width: 10,
                          height: 3,
                        ),
                          // RectangleNumber(controller: controller,), 
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ImageTitleColumn(
                      icon: "assets/details-match/main.png",
                      title: "bonnes réponses",
                      fontFamily: "InterMedium",
                      fontSize: 14,
                      scale: 2,
                    ),
                    SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // RectangleNumber(controller: controller,), 
                        Container(
                          color: eptOrange,
                          width: 10,
                          height: 3,
                        ),
                          // RectangleNumber(controller: controller,), 
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ImageTitleColumn(
                      icon: "assets/details-match/main.png",
                      title: "bonnes réponses",
                      fontFamily: "InterMedium",
                      fontSize: 14,
                      scale: 2,
                    ),
                    SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // RectangleNumber(controller: controller,), 
                        Container(
                          color: eptOrange,
                          width: 10,
                          height: 3,
                        ),
                          // RectangleNumber(controller: controller,), 
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Scorers(),
                  Scorers(),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: 200,
              height: 2,
              color: Colors.black,
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Row(
                      children: [
                        InkWell(
                          child: Image.asset("assets/details-match/pouce.png", scale: 4,),
                        ),
                        const SizedBox(width: 5,),
                        const Text("999")
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(
                          child: Image.asset("assets/details-match/commentaires.png", scale: 4,),
                        ),
                          const SizedBox(width: 5,),
                        InkWell(
                          child: Image.asset("assets/details-match/partager.png", scale: 4,),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            SizedBox(height: 5,),
            CommentaireItem(content: "Lorem ipsum dolor sit amet consectetur. Duis mauris id in metus pellentesque duis. Sed at et erat et neque senectus leo. In pulvinar eu mauris varius stuff.",
            name: "Elimane Sall",
            ),
            const SizedBox(height: 50,)
          ],
        ),
      ),
    ));
  }
}

