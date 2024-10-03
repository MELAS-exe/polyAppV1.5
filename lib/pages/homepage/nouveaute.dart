import 'package:flutter/material.dart';
import 'package:polyapp/util/category_selection.dart';
import 'package:polyapp/util/constante.dart';
import 'package:polyapp/util/infocard.dart';
import 'package:polyapp/util/section_selector.dart';

List<InfoCard> listeInfoCard = [
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: 140,
      height: 200,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: 140,
      height: 200,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: 140,
      height: 200,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: 140,
      height: 200,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: 140,
      height: 200,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: 140,
      height: 200,
      borderRadius: 20),
];
List<InfoCard> listeInfoCard2 = [
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-02 at 15.45.03_affac0af.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: 140,
      height: 200,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-02 at 15.45.03_affac0af.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: 140,
      height: 200,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-02 at 15.45.03_affac0af.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: 140,
      height: 200,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-02 at 15.45.03_affac0af.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: 140,
      height: 200,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-02 at 15.45.03_affac0af.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: 140,
      height: 200,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-02 at 15.45.03_affac0af.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: 140,
      height: 200,
      borderRadius: 20),
];
List<InfoCard> listeInfoCard3 = [
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: 140,
      height: 200,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: 140,
      height: 200,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: 140,
      height: 200,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: 140,
      height: 200,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: 140,
      height: 200,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: 140,
      height: 200,
      borderRadius: 20),
];

class Nouveaute extends StatefulWidget {
  const Nouveaute({super.key});

  @override
  State<Nouveaute> createState() => _NouveauteState();
}

class _NouveauteState extends State<Nouveaute> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Nouveautés",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              Row(
                children: [
                  const Text("voir tout",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color.fromARGB(255, 200, 97, 97))),
                  const SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    "assets/Homepage/icons8-flèche-droite-90.png",
                    scale: 4,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    SectionSelector(
                      value: 1,
                      groupValue: _value,
                      onChanged: (int? value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                      text: "Polytech-info",
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    SectionSelector(
                      value: 2,
                      groupValue: _value,
                      onChanged: (int? value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                      text: "Interclasses",
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    SectionSelector(
                      value: 3,
                      groupValue: _value,
                      onChanged: (int? value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                      text: "Commerce",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CategorySelection(
                  value: _value - 1,
                  itemLists: [listeInfoCard, listeInfoCard2, listeInfoCard3],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
