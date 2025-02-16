import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:polyapp/models/basket.dart';
import 'package:polyapp/models/buteur.dart';
import 'package:polyapp/models/commentaires.dart';
import 'package:polyapp/models/commission.dart';
import 'package:polyapp/models/enums/sport_type.dart';
import 'package:polyapp/models/equipe.dart';
import 'package:polyapp/models/football.dart';
import 'package:polyapp/models/jeu.dart';
import 'package:polyapp/models/jeux_esprit.dart';
import 'package:polyapp/models/joueur.dart';
import 'package:polyapp/models/joueur_jeu.dart';
import 'package:polyapp/models/match.dart';
import 'package:polyapp/models/session_jeu.dart';
import 'package:polyapp/models/utilisateur.dart';
import 'package:polyapp/models/volleyball.dart';

class JeuService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> jeuxCollection =
      FirebaseFirestore.instance.collection("JEUX");

  Future<List<Jeu>> getAllJeux() async {
    List<Jeu> list = [];
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await jeuxCollection.get();

      List<Map<String, dynamic>> data =
          querySnapshot.docs.map((doc) => doc.data()).toList();
      for (var d in data) {
        list.add(Jeu.fromJson(d));
      }

      return list;
    } catch (e) {
      return [];
    }
  }

  Future<String> postJeu(dynamic football) async {
    try {
      await jeuxCollection
          .doc(football.equipeA.nom +
              " VS " +
              football.equipeB.nom +
              football.date.toString())
          .set(football.toJson());
      return "OK";
    } catch (e) {
      return "Erreur lors de la création du match : $e";
    }
  }

  Future<Jeu?> getJeuId(String id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await jeuxCollection.where('id', isEqualTo: id).get();

      if (querySnapshot.docs.isNotEmpty) {
        return Jeu.fromJson(querySnapshot.docs.first.data());
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<Jeu?> postSessionJeu(String idJeu, String lieu) async {
    try {
      String email = FirebaseAuth.instance.currentUser!.email!;

      // Récupérer l'utilisateur avec l'email
      QuerySnapshot userSnapshot = await _firestore
          .collection("USER")
          .where('email', isEqualTo: email)
          .limit(1)
          .get();
      if (userSnapshot.docs.isEmpty) return null;

      Map<String, dynamic> userData =
          userSnapshot.docs.first.data() as Map<String, dynamic>;

      Utilisateur utilisateur = Utilisateur.fromJson(userData);

      QuerySnapshot jeuxSnapshot =
          await jeuxCollection.where('id', isEqualTo: idJeu).limit(1).get();

      if (jeuxSnapshot.docs.isEmpty) {
        print("Document non trouvé");
        return null; // Le document n'existe pas, retourner null ou gérer l'erreur
      }

      // Récupérer la référence du document trouvé
      DocumentReference matchDoc = jeuxSnapshot.docs.first.reference;

      SessionJeu sessionJeu = SessionJeu(
          date: DateTime.now(),
          lieu: lieu,
          id: DateTime.now().toString(),
          joueurs: [
            JoueurJeu(
                id: utilisateur.id!,
                waiting: true,
                email: email,
                prenom: utilisateur.prenom,
                nom: utilisateur.nom)
          ],
          statut: StatutSessionJeu.OUVERTE);

      await matchDoc.update(
        {
          'sessions': FieldValue.arrayUnion([sessionJeu.toJson()])
        },
      );

      DocumentSnapshot querySnapshot = await matchDoc.get();

      return Jeu.fromJson(querySnapshot.data() as Map<String, dynamic>);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Jeu?> postRejoindreSessionJeu(String idJeu) async {
    try {
      String email = FirebaseAuth.instance.currentUser!.email!;

      // Récupérer l'utilisateur avec l'email
      QuerySnapshot userSnapshot = await _firestore
          .collection("USER")
          .where('email', isEqualTo: email)
          .limit(1)
          .get();
      if (userSnapshot.docs.isEmpty) return null;

      Map<String, dynamic> userData =
          userSnapshot.docs.first.data() as Map<String, dynamic>;

      Utilisateur utilisateur = Utilisateur.fromJson(userData);

      // Rechercher le document de jeu avec l'id spécifié
      QuerySnapshot jeuxSnapshot =
          await jeuxCollection.where('id', isEqualTo: idJeu).limit(1).get();

      if (jeuxSnapshot.docs.isEmpty) {
        print("Jeu non trouvé");
        return null;
      }

      // Récupérer la référence et les données du document trouvé
      DocumentReference matchDoc = jeuxSnapshot.docs.first.reference;
      Map<String, dynamic> jeuData =
          jeuxSnapshot.docs.first.data() as Map<String, dynamic>;

      // Récupérer les sessions dans le jeu
      List<dynamic> sessions = jeuData['sessions'] ?? [];

      // Mettre à jour la première session (ou trouver la session à modifier)
      if (sessions.isNotEmpty) {
        Map<String, dynamic> session =
            sessions.first; // Adapter si plusieurs sessions

        List<dynamic> joueurs = session['joueurs'] ?? [];

        // Vérifier si le joueur existe déjà
        bool joueurExiste = joueurs.any((joueur) => joueur['email'] == email);

        if (joueurExiste) {
          return null;
        }

        // Créer un nouveau joueur
        JoueurJeu joueurJeu = JoueurJeu(
            id: utilisateur.id!,
            waiting: true,
            email: email,
            prenom: utilisateur.prenom,
            nom: utilisateur.nom);

        // Ajouter le joueur à la liste des joueurs
        joueurs.add(joueurJeu.toJson());

        // Mettre à jour la session avec la nouvelle liste de joueurs
        session['joueurs'] = joueurs;

        // Mettre à jour le document du jeu avec la session modifiée
        await matchDoc.update({
          'sessions':
              sessions, // Remplacer l'ensemble des sessions mises à jour
        });

        // Récupérer les données mises à jour
        DocumentSnapshot querySnapshot = await matchDoc.get();

        return Jeu.fromJson(querySnapshot.data() as Map<String, dynamic>);
      } else {
        print("Aucune session trouvée");
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Jeu?> quitterSessionJeu(String idJeu, JoueurJeu joueur) async {
    try {
      // Rechercher le document de jeu avec l'id spécifié
      QuerySnapshot jeuxSnapshot =
          await jeuxCollection.where('id', isEqualTo: idJeu).limit(1).get();

      if (jeuxSnapshot.docs.isEmpty) {
        print("Jeu non trouvé");
        return null;
      }

      // Récupérer la référence et les données du document trouvé
      DocumentReference matchDoc = jeuxSnapshot.docs.first.reference;
      Map<String, dynamic> jeuData =
          jeuxSnapshot.docs.first.data() as Map<String, dynamic>;

      // Récupérer les sessions dans le jeu
      List<dynamic> sessions = jeuData['sessions'] ?? [];

      // Mettre à jour la première session (ou trouver la session à modifier)
      if (sessions.isNotEmpty) {
        Map<String, dynamic> session =
            sessions.first; // Adapter si plusieurs sessions

        List<dynamic> joueurs = session['joueurs'] ?? [];

        // Retirer le joueur de la liste s'il existe
        joueurs.removeWhere((j) => j['email'] == joueur.email);

        // Mettre à jour la session avec la nouvelle liste de joueurs
        session['joueurs'] = joueurs;

        // Mettre à jour le document du jeu avec la session modifiée
        await matchDoc.update({
          'sessions':
              sessions, // Remplacer l'ensemble des sessions mises à jour
        });

        // Récupérer les données mises à jour
        DocumentSnapshot querySnapshot = await matchDoc.get();

        return Jeu.fromJson(querySnapshot.data() as Map<String, dynamic>);
      } else {
        print("Aucune session trouvée");
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Jeu?> deleteSessionJeu(String idJeu, SessionJeu session) async {
    try {
      // Rechercher le document de jeu avec l'id spécifié
      QuerySnapshot jeuxSnapshot =
          await jeuxCollection.where('id', isEqualTo: idJeu).limit(1).get();

      if (jeuxSnapshot.docs.isEmpty) {
        print("Jeu non trouvé");
        return null;
      }

      // Récupérer la référence et les données du document trouvé
      DocumentReference matchDoc = jeuxSnapshot.docs.first.reference;
      Map<String, dynamic> jeuData =
          jeuxSnapshot.docs.first.data() as Map<String, dynamic>;

      // Récupérer les sessions dans le jeu
      List<dynamic> sessions = jeuData['sessions'] ?? [];

      // Vérifier si la session à supprimer existe
      if (sessions.isNotEmpty) {
        // Supprimer la session spécifiée
        sessions.removeWhere((s) => s['id'] == session.id);

        // Mettre à jour le document du jeu avec les sessions modifiées
        await matchDoc.update({
          'sessions':
              sessions, // Remplacer l'ensemble des sessions mises à jour
        });

        // Récupérer les données mises à jour
        DocumentSnapshot querySnapshot = await matchDoc.get();

        return Jeu.fromJson(querySnapshot.data() as Map<String, dynamic>);
      } else {
        print("Aucune session trouvée");
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Football?> updateStatistique(
      String matchId, String libelle, int value) async {
    try {
      DocumentReference matchDoc = _firestore.collection("MATCH").doc(matchId);
      await matchDoc.update(
        {"statistiques.$libelle": FieldValue.increment(value)},
      );

      DocumentSnapshot querySnapshot = await matchDoc.get();

      return Football.fromJson(querySnapshot.data() as Map<String, dynamic>);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Football?> addButeur(String matchId, Joueur joueur, int minute,
      String libelleScore, String libelleBut,
      [int increment = 1]) async {
    try {
      DocumentReference matchDoc = _firestore.collection("MATCH").doc(matchId);
      But but = But(
          joueur: joueur,
          id: DateTime.now().toString(),
          date: DateTime.now(),
          minute: minute);
      await matchDoc.update(
        {
          libelleBut: FieldValue.arrayUnion([but.toJson()]),
          libelleScore: FieldValue.increment(increment)
        },
      );

      DocumentSnapshot querySnapshot = await matchDoc.get();
      print(querySnapshot.data());

      return Football.fromJson(querySnapshot.data() as Map<String, dynamic>);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
