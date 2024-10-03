import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polyapp/pages/authentification/login.dart';
import 'package:polyapp/util/constante.dart';
import 'package:polyapp/util/drawer_tile.dart';

class EptDrawer extends StatelessWidget {
  const EptDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double size = 150;
    return Drawer(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: eptLighterOrange,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
                width: size,
                height: size,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: eptOrange,
                ),
                child: Container(
                  width: size,
                  height: size,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(200)),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    "assets/Homepage/homepagephoto.jpg",
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Gnatam Guaye",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            const SizedBox(
              height: 20,
            ),

            Container(
              width: 200,
              height: 1,
              color: Colors.black,
            ),

            const SizedBox(
              height: 20,
            ),
            DrawerItem(
                imagePath: "assets/top-left-menu/compte.png",
                title: "Compte",
                onTap: () {}),
            DrawerItem(
                imagePath: "assets/top-left-menu/famille.png",
                title: "Famille Polytechnicienne",
                onTap: () {}),
            DrawerItem(
                imagePath: "assets/top-left-menu/jumelles.png",
                title: "Objets perdus",
                onTap: () {}),
            DrawerItem(
                imagePath: "assets/top-left-menu/paramètres.png",
                title: "Paramètres",
                onTap: () {}),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: 200,
              height: 1,
              color: Colors.black,
            ),

            const SizedBox(
              height: 20,
            ),

            DrawerItem(
              imagePath: "assets/top-left-menu/facebook.png",
              title: "compte",
              onTap: () {},
              isLink: true,
            ),
            DrawerItem(
              imagePath: "assets/top-left-menu/instagram.png",
              title: "compte",
              onTap: () {},
              isLink: true,
            ),
            DrawerItem(
              imagePath: "assets/top-left-menu/x.png",
              title: "compte",
              onTap: () {},
              isLink: true,
            ),
            DrawerItem(
              imagePath: "assets/top-left-menu/internet.png",
              title: "compte",
              onTap: () {},
              isLink: true,
            ),
            // SizedBox(height: 15,),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => Login()));
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                    color: eptOrange, borderRadius: BorderRadius.circular(5)),
                child: Row(children: [
                  Image.asset(
                    "assets/top-left-menu/sortie.png",
                    scale: 4,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Déconnexion",
                    style: TextStyle(fontFamily: "Inter", fontSize: 12),
                  ),
                ]),
              ),
            ),
            const Spacer(),
            const Text(
              "PolyApp version 1.0.0",
              style: TextStyle(
                  fontFamily: "Inter", fontSize: 10, color: eptDarkGrey),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 5,
              color: eptOrange,
            )
          ],
        ),
      ),
    );
  }
}
