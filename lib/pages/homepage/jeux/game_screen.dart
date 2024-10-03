import 'package:flutter/material.dart';
import 'package:polyapp/fonctions.dart';
import 'package:polyapp/models/jeu.dart';
import 'package:polyapp/models/joueur.dart';
import 'package:polyapp/models/session_jeu.dart';
import 'package:polyapp/services/jeu_service.dart';
import 'package:polyapp/util/app_colors.dart';
import 'package:polyapp/util/ept_back_button.dart';
import 'package:polyapp/widgets/alerte_message.dart';
import 'package:polyapp/widgets/delete_confirmed_dialog.dart';
import 'package:polyapp/widgets/submited_button.dart';
import 'package:polyapp/fonctions.dart';
import 'package:polyapp/models/jeu.dart';
import 'package:polyapp/models/session_jeu.dart';
import 'package:polyapp/util/app_colors.dart';
import 'package:polyapp/widgets/alerte_message.dart';
import 'package:polyapp/widgets/delete_confirmed_dialog.dart';

class GameScreen extends StatelessWidget {
  String id;
  GameScreen(this.id, {super.key});

  final JeuService _jeuService = JeuService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: FutureBuilder<Jeu?>(
            future: _jeuService.getJeuId(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const Text('Erreur lors du chargement');
              } else {
                Jeu? jeu = snapshot.data;
                return jeu != null
                    ? Column(
                        children: [
                          Stack(alignment: Alignment.center, children: [
                            // Image de fond
                            Container(
                              height: 350,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/jeux/jeux-background.png'), // Image de fond à ajouter dans 'assets'
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                                top: 20, left: 20, child: EptBackButton()),

                            const SizedBox(height: 20),

                            // Logo UNO
                            Container(
                              width: 230,
                              height: 230,
                              decoration: BoxDecoration(),
                              child: Image.network(
                                jeu.logo, // Image UNO dans 'assets'
                                scale: 1,

                                fit: BoxFit.fill,
                              ),
                            ),

                            const SizedBox(height: 10),

                            // Texte UNO
                            Positioned(
                              bottom: 20,
                              child: Text(
                                jeu.nom,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]),
                          // Contenu de la page
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                    height: 30), // Pour espacer du haut de l'écra
                            
                                // Règles du jeu
                                const Text(
                                  "Règles:",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "Inter"),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  jeu.regle,
                                  style: const TextStyle(fontSize: 12, fontFamily: "InterMedium", fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  "Sessions:",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 20,),
                                 Center(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      TextEditingController lieuController =
                                          TextEditingController();
                            
                                      // Afficher un dialog pour saisir le lieu
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                                'Entrer le lieu de la session'),
                                            content: TextField(
                                              controller: lieuController,
                                              decoration: const InputDecoration(
                                                  hintText: 'Lieu'),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(); // Fermer le dialog
                                                },
                                                child: const Text('Annuler'),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  String lieu =
                                                      lieuController.text;
                                                  if (lieu.isNotEmpty) {
                                                    // Poster la session si le lieu est saisi
                                                    Jeu? jeu = await _jeuService
                                                        .postSessionJeu(id, lieu);
                                                    Navigator.of(context)
                                                        .pop(); // Fermer le dialog
                                                    if (jeu != null) {
                                                      alerteMessageWidget(
                                                        context,
                                                        "Session créée avec succès.",
                                                        AppColors.success,
                                                      );
                                                    }
                                                  } else {
                                                    alerteMessageWidget(
                                                        context,
                                                        "Veuillez entrer un lieu.",
                                                        AppColors.echec);
                                                  }
                                                },
                                                child: const Text('Valider'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: orange,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    child: const Text(
                                      'Créer une session',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                // Bouton "Créer une session"
                                ListView.builder(
                                    shrinkWrap:
                                        true, // Pour permettre à ListView de fonctionner dans SingleChildScrollView
                                    physics:
                                        const NeverScrollableScrollPhysics(), // Pour éviter le conflit avec le scroll principal
                                    itemCount:
                                        jeu.sessions.length, // Nombre de sessions
                                    itemBuilder: (context, index) {
                                      SessionJeu session = jeu!.sessions[index];
                                      return session.statut ==
                                              StatutSessionJeu.OUVERTE
                                          ? GestureDetector(
                                              onLongPress: () async {
                                                // if (session.user.email ==
                                                //     FirebaseAuth.instance
                                                //         .currentUser!.email) {
                                                bool confirm = await showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return deleteConfirmedDialog(
                                                        context,
                                                        "Voulez-vous vraiment supprimer cette session ?");
                                                  },
                                                );
                            
                                                if (confirm) {
                                                  jeu = await _jeuService
                                                      .deleteSessionJeu(
                                                          id, session);
                                                }
                                              },
                                              child: ExpansionTile(
                                                  expandedCrossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  title: Text(
                                                    "Session à ${session.lieu} ${timeAgoCustom(session.date)}",
                                                    style: TextStyle(
                                                        fontSize:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.04,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  children: [
                                                    Text(
                                                      "Il y a ${session.joueurs.length} joueurs en attente à ${session.lieu}",
                                                      style: const TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    Container(
                                                        width: double.infinity,
                                                        padding:
                                                            const EdgeInsets.all(
                                                                16),
                                                        decoration: BoxDecoration(
                                                          color: Colors.grey[200],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: session
                                                              .joueurs
                                                              .map((joueur) {
                                                            return Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const SizedBox(
                                                                      height: 10),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                          "${joueur.prenom} ${joueur.nom.toUpperCase()}"),
                                                                    ],
                                                                  ),
                                                                ]);
                                                          }).toList(),
                                                        )),
                                                    ElevatedButton(
                                                      onPressed: () async {
                                                        try {
                                                          Jeu? jeu = await _jeuService
                                                              .postRejoindreSessionJeu(
                                                                  id);
                                                          if (jeu == null) {
                                                            alerteMessageWidget(
                                                                context,
                                                                "Vous etes déjà dans la session.",
                                                                AppColors.echec);
                                                          } else {
                                                            alerteMessageWidget(
                                                                context,
                                                                "Bienvenue dans la session.",
                                                                AppColors
                                                                    .success);
                                                          }
                                                        } catch (e) {}
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            grisClair,
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 10,
                                                            vertical: 5),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      ),
                                                      child: const Text(
                                                        'Rejoindre',
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.black),
                                                      ),
                                                    ),
                                                  ]))
                                          : Container(
                                              height: 0,
                                            );
                                    }),
                            
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                      )
                    : const Text("Aucun jeu trouvé");
              }
            }),
      )),
    );
  }
}
