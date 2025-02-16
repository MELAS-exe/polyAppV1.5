import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:polyapp/models/objet_perdu_model.dart';
import 'dart:io';

class ObjetPerduService {
  final _firestore = FirebaseFirestore.instance;

  Future<String?> uploadImage(File imageFile) async {
    try {
      // Create a reference to the Firebase Storage location
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('LOSTOBJECTS/${imageFile.path.split('/').last}');

      // Upload the file
      final uploadTask = storageRef.putFile(imageFile);

      // Get the download URL once the upload is complete
      final TaskSnapshot taskSnapshot = await uploadTask;
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> addLostObject(ObjetPerdu objetPerdu) async {
    try {
      await _firestore.collection('LOSTOBJECTS').add({
        'description': objetPerdu.description,
        'details': objetPerdu.details,
        'photoURL': objetPerdu.photoURL,
        'lieu': objetPerdu.lieu,
        'date': objetPerdu.date,
        'etat': objetPerdu.estTrouve,
        'idUser': objetPerdu.idUser
      });
    } catch (e) {
      print(e);
      return null;
    }
  }

  Stream<QuerySnapshot> getLostObjects() {
    return _firestore
        .collection('LOSTOBJECTS')
        .orderBy('etat', descending: false)
        .snapshots();
  }

  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    try {
      var snapshot = await _firestore
          .collection('LOSTOBJECTS')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();
      return snapshot.docs[0].data();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> toggleFoundStatus(String docId, int value) async {
    try {
      _firestore
          .collection('LOSTOBJECTS')
          .doc(docId)
          .update({'etat': value});
    } catch (e) {
      print('Error: $e');
    }
  }
}
