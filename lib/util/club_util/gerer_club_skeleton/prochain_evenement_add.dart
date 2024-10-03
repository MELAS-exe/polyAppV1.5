import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:polyapp/util/constante.dart';
import 'package:polyapp/util/ept_back_button.dart';
import 'package:polyapp/util/utils.dart';
import 'dart:io';

class ProchainEvenementAdd extends StatefulWidget {
  String? title;
  ProchainEvenementAdd({super.key, this.title});

  @override
  State<ProchainEvenementAdd> createState() => _ProchainEvenementAddState();
}

class _ProchainEvenementAddState extends State<ProchainEvenementAdd> {
  Image? image;

  void changeImage() async {
    final files = await imageHelper.pickImage();
    if (files.isNotEmpty) {
      final croppedFile = await imageHelper.crop(
          aspectRation: const CropAspectRatio(ratioX: 2, ratioY: 3),
          file: files.first,
          cropStyle: CropStyle.circle);
      if (croppedFile != null) {
        setState(
          () => image = Image.file(
            File(croppedFile.path),
            fit: BoxFit.cover,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String? classe1;
    String? classe2;
    String? date;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 450,
                  child: Image.asset(
                    "assets/modifer-competition/background.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -150,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    color: eptLightOrange,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      color: eptOrange,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            widget.title ?? "Titre",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                child: Image.asset(
                                  "assets/modifer-competition/drop-icon.png",
                                  scale: 4,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(classe1 ?? "Classe"),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text("VS"),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(classe1 ?? "Classe"),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                child: Image.asset(
                                  "assets/modifer-competition/drop-icon.png",
                                  scale: 4,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -30,
                  child: InkWell(
                    onTap: changeImage,
                    child: Container(
                      width: 266,
                      height: 450,
                      decoration: BoxDecoration(
                          color: eptLightGrey,
                          borderRadius: BorderRadius.circular(20)),
                      clipBehavior: Clip.hardEdge,
                      child: image ??
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/modifer-competition/importer.png",
                                scale: 1,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("Importer une image")
                            ],
                          ),
                    ),
                  ),
                ),
                Positioned(top: 20, left: 20, child: EptBackButton())
              ],
            ),
            const SizedBox(
              height: 190,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(date ?? "Date"),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  child: Image.asset(
                    "assets/crayon.png",
                    scale: 4,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  color: eptLighterOrange,
                  borderRadius: BorderRadius.circular(20)),
              child: const TextField(
                expands: true,
                maxLines: null,
                decoration: InputDecoration(
                    hintText: "Description",
                    ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

ImageHelper imageHelper = ImageHelper();
