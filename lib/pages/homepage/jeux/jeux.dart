import 'package:flutter/material.dart';
import 'package:polyapp/fonctions.dart';
import 'package:polyapp/models/jeu.dart';
import 'package:polyapp/pages/homepage/jeux/game_screen.dart';
import 'package:polyapp/services/jeu_service.dart';
import 'package:polyapp/util/gameTiles.dart';

class JeuxHomepage extends StatelessWidget {
  const JeuxHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Jeux",
            style: TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Trouver des joueurs",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildGameIcons()
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildGameIcons() {
  JeuService jeuService = JeuService();
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: FutureBuilder<List<Jeu>?>(
        future: jeuService.getAllJeux(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text('Erreur lors de la récupération des données');
          } else {
            List<Jeu> jeux = snapshot.data!;
            return jeux.isNotEmpty
                ? Row(
                    children: [
                      for (var i in jeux)
                        GestureDetector(
                            onTap: () {
                              changerPage(context, GameScreen(i.id));
                            },
                            child: GameTile(
                                imagePath: i.logo,
                                title: i.nom,
                                playerCount: 4)),
                    ],
                  )
                : const Text("Aucun jeu n'est disponible");
          }
        }),
  );
}
