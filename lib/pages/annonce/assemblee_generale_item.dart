import 'package:flutter/material.dart';
import 'dart:io';

import 'package:polyapp/util/constante.dart';

class AssembleeGeneraleItem extends StatelessWidget {
  final String date;
  final String time;
  final String location;
  final String topic;
  File? communique;

  AssembleeGeneraleItem(
      {super.key,
      required this.date,
      required this.time,
      required this.location,
      required this.topic,
      this.communique});

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          width: 370,
          height: 180,
          decoration: BoxDecoration(
              color: eptLightOrange, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Assemblée générale",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/polytech-info/calendrier.png",
                    scale: 5,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    date,
                    style: const TextStyle(fontFamily: "Inter", fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/polytech-info/horloge.png",
                    scale: 5,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    time,
                    style: const TextStyle(fontFamily: "Inter", fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/polytech-info/marqueur.png",
                    scale: 5,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    location,
                    style: const TextStyle(fontFamily: "Inter", fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/polytech-info/topic.png",
                    scale: 5,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    topic,
                    style: const TextStyle(fontFamily: "Inter", fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: Text(
                      "Voir communiqué",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      Positioned(
          right: -50,
          top: -60,
          child: Image.asset(
            "assets/polytech-info/info_image.png",
            scale: 7,
          )),
    ]);
  }
}
