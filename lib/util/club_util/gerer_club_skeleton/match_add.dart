import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polyapp/util/club_util/gerer_club_skeleton/rectangle_number.dart';
import 'package:polyapp/util/club_util/gerer_club_skeleton/scorers.dart';
import 'package:polyapp/util/constante.dart';
import 'package:polyapp/util/ept_back_button.dart';
import 'package:polyapp/util/ept_button.dart';
import 'package:polyapp/util/image_title_column.dart';

TextEditingController controller = TextEditingController(text: "0");

class MatchAdd extends StatefulWidget {
  const MatchAdd({super.key});

  @override
  State<MatchAdd> createState() => MatchAddState();
}

class MatchAddState extends State<MatchAdd> {
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
                      const Text("Ajouter un match",
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
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 100,
                                height: 30,
                                color: eptOrange,
                                child: DropdownButton(
                                    isExpanded: true,
                                    items: const [],
                                    onChanged: (SizedBox) {}),
                              ),
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
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 100,
                                height: 30,
                                color: eptOrange,
                                child: DropdownButton(
                                    isExpanded: true,
                                    items: const [],
                                    onChanged: (SizedBox) {}),
                              ),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/crayon-blanc.png",
                                  scale: 4,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "Score",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ],
                            ),
                            const Text(
                              "-",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Score",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  "assets/crayon-blanc.png",
                                  scale: 4,
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
                    Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RectangleNumber(controller: controller,), 
                        Container(
                          color: eptOrange,
                          width: 10,
                          height: 3,
                        ),
                          RectangleNumber(controller: controller,), 
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
                    Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RectangleNumber(controller: controller,), 
                        Container(
                          color: eptOrange,
                          width: 10,
                          height: 3,
                        ),
                          RectangleNumber(controller: controller,), 
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
                    Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RectangleNumber(controller: controller,), 
                        Container(
                          color: eptOrange,
                          width: 10,
                          height: 3,
                        ),
                          RectangleNumber(controller: controller,), 
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Scorers(),
                  Scorers(),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text("Date: "),
                SizedBox(height: 10,),
                Container(
                  width: 300,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1)
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none
                      )
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text("Titre: "),
                SizedBox(height: 10,),
                Container(
                  width: 300,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1)
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none
                      )
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            EptButton(title: "Confirmer", width: 150, height: 40, borderRadius: 5,),
            SizedBox(height: 50,),
          ],
        ),
      ),
    ));
  }
}
