import 'package:flutter/material.dart';
import 'package:polyapp/util/category_selection.dart';
import 'package:polyapp/util/infocard.dart';
import 'package:polyapp/util/p_info_section_selector.dart';

class PInfoNouveaute extends StatefulWidget {
  const PInfoNouveaute({super.key});

  @override
  State<PInfoNouveaute> createState() => _PInfoNouveauteState();
}

class _PInfoNouveauteState extends State<PInfoNouveaute> {
  int groupValue = 0;
  @override
  Widget build(BuildContext context) {
    bool isAdmin = true;
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Nouveautés",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            if (isAdmin) ...[
              const SizedBox(
                width: 5,
              ),
              InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/polytech-info/plus.png",
                    scale: 5,
                  )),
            ]
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PInfoSectionSelector(
                    value: 0,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    },
                    image: Image.asset(
                      "assets/polytech-info/logo_adept.jpg",
                      scale: 30,
                    )),
                const SizedBox(
                  width: 10,
                ),
                PInfoSectionSelector(
                    value: 1,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    },
                    image: Image.asset(
                      "assets/polytech-info/logo sc-medicale.png",
                      scale: 30,
                    )),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CategorySelection(
            itemLists: [listeInfoCard, listeInfoCard2, listeInfoCard3],
            value: groupValue),
      ],
    );
  }
}

double width = 200;
double height = 320;
List<InfoCard> listeInfoCard = [
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: width,
      height: height,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: width,
      height: height,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: width,
      height: height,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: width,
      height: height,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: width,
      height: height,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: width,
      height: height,
      borderRadius: 20),
];
List<InfoCard> listeInfoCard2 = [
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-02 at 15.45.03_affac0af.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: width,
      height: height,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-02 at 15.45.03_affac0af.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: width,
      height: height,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-02 at 15.45.03_affac0af.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: width,
      height: height,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-02 at 15.45.03_affac0af.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: width,
      height: height,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-02 at 15.45.03_affac0af.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: width,
      height: height,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-02 at 15.45.03_affac0af.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: width,
      height: height,
      borderRadius: 20),
];
List<InfoCard> listeInfoCard3 = [
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: width,
      height: height,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: width,
      height: height,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: width,
      height: height,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: width,
      height: height,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: width,
      height: height,
      borderRadius: 20),
  InfoCard(
      image: Image.asset(
        "assets/Homepage/WhatsApp Image 2024-06-04 at 13.00.13_44aca086.jpg",
        fit: BoxFit.cover,
      ),
      widget: Container(),
      width: width,
      height: height,
      borderRadius: 20),
];
