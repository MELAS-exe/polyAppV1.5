import 'package:flutter/material.dart';
import 'package:polyapp/fonctions.dart';
import 'package:polyapp/util/constante.dart';

class GameTile extends StatefulWidget {
  String? imagePath;
  final String title;
  int playerCount;

  GameTile({
    super.key,
    this.imagePath,
    required this.title,
    this.playerCount = 0,
    });

  @override
  State<GameTile> createState() => _GameTileState();
}

class _GameTileState extends State<GameTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: Column(
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontFamily: "inter",
              fontSize: 10, 
            ),
          ),
          SizedBox(height: 5,),
          Container(
            padding: const EdgeInsets.all(3),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: etpGrey
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              clipBehavior: Clip.hardEdge,
              child: widget.imagePath != null ? Image.network(
                widget.imagePath!,
                fit: BoxFit.cover,
                ): const SizedBox(),
            ),
          ),
          SizedBox(height: 5,),
            Text(
            "${widget.playerCount} joeurs en cours",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 10, 
            ),
          ),
        ],
      ),
    );
  }
}
