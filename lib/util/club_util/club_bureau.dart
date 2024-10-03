import 'package:flutter/material.dart';
import 'package:polyapp/util/club_util/club_person.dart';

class ClubBureau extends StatefulWidget {
  List<Membres>? listeMembres;
  ClubBureau({super.key, this.listeMembres});

  @override
  State<ClubBureau> createState() => _ClubBureauState();
}

class _ClubBureauState extends State<ClubBureau> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return widget.listeMembres![index];
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
                  width: 20,
                ),
            itemCount:
                widget.listeMembres != null ? widget.listeMembres!.length : 0),
      ),
    );
  }
}
