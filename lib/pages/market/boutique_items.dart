import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:polyapp/util/constante.dart';

class BoutiqueItems extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;
  bool isOrdered;

  BoutiqueItems(
      {super.key,
      required this.title,
      required this.price,
      required this.imagePath,
      this.isOrdered = false}); 

  Future<bool> assetExists(String path) async {
    try {
      final file = File(path);
      await file.readAsBytes();
      return true;
    } catch (e) {
      if (e is FileSystemException) {
      }
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          width: 170,
          height: 190,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            child: FutureBuilder<bool>(
              future: assetExists(imagePath),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData && snapshot.data == true) {
                    // If asset exists, display the image
                    return Container(
                      width: 170,
                      height: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.file(File(imagePath), fit: BoxFit.cover),
                    );
                  } else {
                    return Image.asset("assets/no-image.png",);
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(
              fontFamily: "Inter", fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 5),
        Text(
          "$price Fcfa",
          style: const TextStyle(
            fontFamily: "Inter",
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
