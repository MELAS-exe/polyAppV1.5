import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:polyapp/util/constante.dart';
import 'package:polyapp/util/ept_button.dart';
import 'package:polyapp/util/utils.dart';
import 'dart:io';

class ProchainEvenementEdit extends StatefulWidget {
  Image? image;
  ProchainEvenementEdit({super.key, this.image});

  @override
  State<ProchainEvenementEdit> createState() => _ProchainEvenementEditState();
}

class _ProchainEvenementEditState extends State<ProchainEvenementEdit> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 300,
          decoration: BoxDecoration(
              color: eptLightGrey, borderRadius: BorderRadius.circular(20)),
          clipBehavior: Clip.hardEdge,
          child: widget.image ?? const SizedBox(),
        ),
        SizedBox(height: 20,),
        EptButton(
          title: "Retirer",
          width: 150,
          height: 40,
          fontsize: 18,
          borderRadius: 5,
          onTap: () {
            setState(() {
              widget.image = null;
            });
          },
        )
      ],
    );
  }
}
