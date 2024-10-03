import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:polyapp/util/constante.dart';
import 'package:polyapp/util/utils.dart';
import 'dart:io';

class LogoClubEdit extends StatefulWidget {
  Image? image;
  String? title;
  LogoClubEdit({super.key, this.image, this.title});

  @override
  State<LogoClubEdit> createState() => _LogoClubEditState();
}

class _LogoClubEditState extends State<LogoClubEdit> {
  void changeImage() async {
    final files = await imageHelper.pickImage();
    if (files.isNotEmpty) {
      final croppedFile = await imageHelper.crop(
          aspectRation: const CropAspectRatio(ratioX: 1, ratioY: 1),
          file: files.first,
          cropStyle: CropStyle.circle);
      if (croppedFile != null) {
        setState(() => widget.image = Image.file(File(croppedFile.path)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    File? image;
    return Column(
      children: [
        InkWell(
          onTap: changeImage,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                color: eptLightGrey, borderRadius: BorderRadius.circular(300)),
            clipBehavior: Clip.hardEdge,
            child: widget.image ?? const SizedBox(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              widget.title ?? "Club Name",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: changeImage,
              child: Image.asset(
                "assets/crayon.png",
                scale: 4,
              ),
            )
          ],
        ),
      ],
    );
  }
}

final imageHelper = ImageHelper();
