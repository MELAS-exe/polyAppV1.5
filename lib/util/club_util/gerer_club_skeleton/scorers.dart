import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polyapp/util/constante.dart';
import 'package:tuple/tuple.dart';

class Scorers extends StatefulWidget {
  const Scorers({super.key});

  @override
  State<Scorers> createState() => _ScorersState();
}

class _ScorersState extends State<Scorers> {
  @override
  Widget build(BuildContext context) {
    List <Tuple2<String, int>> listScoreurs = [
      Tuple2("Abdou Fatah", 0),
      Tuple2("Abdou Fatah", 0),
      Tuple2("Abdou Fatah", 0),
      Tuple2("Abdou Fatah", 0),
      Tuple2("Abdou Fatah", 0),
      Tuple2("Abdou Fatah", 0),
      Tuple2("Abdou Fatah", 0),
      Tuple2("Abdou Fatah", 0),
      Tuple2("Abdou Fatah", 0),
      Tuple2("Abdou Fatah", 0),
    ];
    return Column(
      children: [
        SizedBox(
          width: 170,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Scorers"),
              InkWell(
                child: Image.asset("assets/plus.png", scale: 5,)
              )
            ],
          ),
        ),
        SizedBox(height: 5,),
        Container(
          padding: const EdgeInsets.all(8),
          width: 170,
          height: 100,
          color: eptLightGrey,
          child: ListView.separated(itemBuilder: (BuildContext context, int index){
            return Container(
              padding: const EdgeInsets.all(5),
              width: 170,
              height: 30,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(listScoreurs[0].item1, style: TextStyle(fontSize: 12),),
                  Text("${listScoreurs[0].item2} pts", style: TextStyle(fontSize: 12),),
                ]
              ),
            );
          }, separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 5,), itemCount: listScoreurs.length),
        )
      ],);
  }
}