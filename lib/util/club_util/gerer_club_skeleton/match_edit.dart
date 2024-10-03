import 'package:flutter/material.dart';
import 'package:polyapp/util/game_resume_tile.dart';

class MatchsEdit extends StatefulWidget {
  List<GameResumeTile>? listeMatchs;
  MatchsEdit({super.key, this.listeMatchs});

  @override
  State<MatchsEdit> createState() => _MatchsEditState();
}

class _MatchsEditState extends State<MatchsEdit> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.centerRight,
                children: [
                  widget.listeMatchs != null
                      ? widget.listeMatchs![index]
                      : Container(),
                  Positioned(
                    right: -15,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          widget.listeMatchs!.remove(index);
                        });
                      },
                      child: Image.asset(
                        "assets/moins.png",
                        scale: 2,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
                height: 10,
              ),
          itemCount:
              widget.listeMatchs != null ? widget.listeMatchs!.length : 0),
    );
  }
}
