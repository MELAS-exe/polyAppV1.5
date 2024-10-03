import 'package:flutter/material.dart';
import 'package:polyapp/models/objet_perdu_model.dart';
import 'package:polyapp/pages/annonce/annonce.dart';
import 'package:polyapp/pages/competition/competition.dart';
import 'package:polyapp/drawer.dart';
import 'package:polyapp/pages/homepage/homepage.dart';
import 'package:polyapp/pages/market/market.dart';
import 'package:polyapp/util/constante.dart';
import 'package:polyapp/pages/objets_perdu/objets_perdu.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 2;
  List<Widget> body = [
    const ObjetsPerdus(),
    const Annonce(),
    const Homepage(),
    const Competition(),
    const Market(),
  ];
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
    double uniScale = 15;
    return SafeArea(
      child: Scaffold(
        key: globalKey,
        drawer: const EptDrawer(),
        backgroundColor: Colors.white,
        body: Stack(children: [
          Center(
            child: body[_currentIndex],
          ),
          IconButton(
            onPressed: () {
              globalKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
            color: Colors.black,
            iconSize: 35,
          ),
        ]),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
          ),
          child: Container(
            decoration: const BoxDecoration(
              border: BorderDirectional(
                  top: BorderSide(color: Colors.black, width: 2)),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: Colors.white,
              currentIndex: _currentIndex,
              onTap: (int newIndex) {
                setState(() {
                  _currentIndex = newIndex;
                });
              },
              items: [
                BottomNavigationBarItem(
                  label: "",
                  icon: Image.asset(
                    "assets/navbar-icons/loupe.png",
                    scale: uniScale,
                  ),
                  activeIcon: Image.asset(
                      "assets/navbar-icons/loupe-selected.png",
                      scale: uniScale),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Image.asset(
                    "assets/navbar-icons/news.png",
                    scale: uniScale,
                  ),
                  activeIcon: Image.asset(
                      "assets/navbar-icons/news-selected.png",
                      scale: uniScale),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Image.asset(
                    "assets/navbar-icons/home.png",
                    scale: uniScale,
                  ),
                  activeIcon: Image.asset(
                      "assets/navbar-icons/home-selected.png",
                      scale: uniScale),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Image.asset(
                    "assets/navbar-icons/competition.png",
                    scale: uniScale,
                  ),
                  activeIcon: Image.asset(
                      "assets/navbar-icons/competition-selected.png",
                      scale: uniScale),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Image.asset(
                    "assets/navbar-icons/shop.png",
                    scale: uniScale,
                  ),
                  activeIcon: Image.asset(
                      "assets/navbar-icons/shop-selected.png",
                      scale: uniScale),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
