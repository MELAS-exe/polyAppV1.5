import 'package:flutter/material.dart';
import 'package:polyapp/util/game_resume_tile.dart';

class MatchsList extends StatefulWidget {
  List<GameResumeTile>? listeMatchs;
  MatchsList({super.key, this.listeMatchs});

  @override
  State<MatchsList> createState() => _MatchsListState();
}

class _MatchsListState extends State<MatchsList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return widget.listeMatchs != null
                ? widget.listeMatchs![index]
                : Container();
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
                height: 10,
              ),
          itemCount:
              widget.listeMatchs != null ? widget.listeMatchs!.length : 0),
    );
  }
}
