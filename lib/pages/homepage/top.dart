import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:polyapp/util/constante.dart';
import 'package:polyapp/util/utils.dart';
import 'package:provider/provider.dart';

class TopRow extends StatefulWidget {
  const TopRow({super.key});

  @override
  State<TopRow> createState() => _TopRowState();
}

class _TopRowState extends State<TopRow> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/Homepage/wsappArtboard 2_1.png"),
        Positioned(
          right: 10,
          bottom: 10,
          child: Container(
            padding: const EdgeInsets.all(2),
            width: 88,
            height: 117,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40)),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                clipBehavior: Clip.hardEdge,
                child: _image != null
                    ? Image.file(
                        _image!,
                        fit: BoxFit.contain,
                      )
                    : null),
          ),
        ),
        const Positioned(
          right: 140,
          bottom: 80,
          child: Text(
            "PolyApp",
            style: TextStyle(
                fontSize: 60, color: Colors.white, fontFamily: "lily"),
          ),
        ),
        const Positioned(
          right: 140,
          bottom: 60,
          child: Text(
            "Convinience at your reach",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: "lily"),
          ),
        ),
        Positioned(
            right: 80,
            bottom: 105,
            child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-45 / 360),
                child: Image.asset(
                  "assets/Homepage/couronne.png",
                  scale: 2,
                ))),
      ],
    );
  }
}

final imageHelper = ImageHelper();
