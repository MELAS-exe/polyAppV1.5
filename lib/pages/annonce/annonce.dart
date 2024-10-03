import 'package:flutter/material.dart';
import 'package:polyapp/pages/annonce/assemblee_generale_item.dart';
import 'package:polyapp/pages/annonce/hot_topic.dart';
import 'package:polyapp/pages/annonce/p_info_nouveaute.dart';
import 'package:polyapp/util/ept_button.dart';

class Annonce extends StatefulWidget {
  const Annonce({super.key});

  @override
  State<Annonce> createState() => _AnnonceState();
}

class _AnnonceState extends State<Annonce> {
  bool annonceAvailable = true;
  bool isAdmin = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 0, 50),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Polytech-Info",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            if (annonceAvailable) ...[
              Row(
                children: [
                  AssembleeGeneraleItem(
                      date: "Jeudi 13 Juin",
                      time: "22h30",
                      location: "Case de Polytechniciens",
                      topic: "Divers"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              if (isAdmin) ...[
                EptButton(
                  title: "Annoncer",
                  width: 150,
                  height: 40,
                  borderRadius: 5,
                )
              ],
              const SizedBox(
                height: 40,
              ),
            ],
            const PInfoNouveaute(),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 250,
              height: 3,
              color: Colors.black,
            ),
            const SizedBox(
              height: 30,
            ),
            const HotTopic(),
          ],
        ),
      )),
    ));
  }
}
