import 'package:flutter/material.dart';
import 'package:polyapp/pages/market/collection_items.dart';
import 'package:polyapp/util/constante.dart';
import 'package:polyapp/util/ept_back_button.dart';
import 'package:polyapp/util/ept_button.dart';

int groupValue = 0;
class Collection extends StatefulWidget {
  final String title;
  final String subtitle;
  const Collection({super.key, required this.title, required this.subtitle});

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  @override
  Widget build(BuildContext context) {
    List<CollectionItems> collectionItems = [
      CollectionItems(value: 0, image: Image.asset("assets/market/photo1.jpg", fit: BoxFit.cover,)),
      CollectionItems(value: 1, image: Image.asset("assets/market/photo2.jpg", fit: BoxFit.cover,)),
      CollectionItems(value: 2, image: Image.asset("assets/market/photo3.jpg", fit: BoxFit.cover,)),
      CollectionItems(value: 3, image: Image.asset("assets/market/photo4.jpg", fit: BoxFit.cover,)),
    ];
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: collectionItems[groupValue],
          ),
          Positioned(
              bottom: 50,
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                width: MediaQuery.of(context).size.width / 1.2,
                height: 140,
                decoration: BoxDecoration(
                  color: eptLightOrange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: Column(
                  children: [
                    Text(widget.title,
                        style: const TextStyle(
                          fontFamily: "Leckerli One",
                          fontSize: 25,
                        )),
                    Text(
                      widget.subtitle,
                      style: const TextStyle(
                          fontFamily: "League Gothic", fontSize: 18),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if(groupValue == 0){groupValue = collectionItems.length - 1;}
                              else{groupValue--;}
                            });
                          },
                          child: Image.asset(
                            "assets/icons8-trier-à-gauche-90.png",
                            scale: 3,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        EptButton(
                          title: "Acheter",
                          width: 150,
                          height: 35,
                          color: Colors.black,
                          fontColor: Colors.white,
                          borderRadius: 5,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if(groupValue == collectionItems.length -1) {
                                groupValue = 0;
                              }else{groupValue++;}
                            });
                          },
                          child: Image.asset(
                            "assets/icons8-trier-à-droite-90.png",
                            scale: 3,
                          ),
                        )
                      ],
                    )
                  ],
                )),
              )),
          Positioned(top: 20, left: 20, child: EptBackButton())
        ],
      ),
    ));
  }
}
