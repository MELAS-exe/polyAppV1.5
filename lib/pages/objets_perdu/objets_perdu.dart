// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart'; // Importer intl pour le formatage des dates
import 'package:polyapp/models/objet_perdu_model.dart';
import 'package:polyapp/models/utilisateur.dart';
import 'package:polyapp/services/user_service.dart';
import 'package:polyapp/util/app_colors.dart'; // Assurez-vous que cette classe existe
import 'package:polyapp/services/lost_found_service.dart';
import 'package:polyapp/util/constante.dart';

class ObjetsPerdus extends StatefulWidget {
  const ObjetsPerdus({super.key});

  @override
  _ObjetsPerdusState createState() => _ObjetsPerdusState();
}

class _ObjetsPerdusState extends State<ObjetsPerdus> {
  final ObjetPerduService _service = ObjetPerduService();
  final currentUser = FirebaseAuth.instance.currentUser;

  TextEditingController dateController = TextEditingController();
  TextEditingController lieuController = TextEditingController();
  TextEditingController objetController = TextEditingController();
  TextEditingController infoSuppController = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker(); // Instance de ImagePicker

  // Search Lost Objects
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Fonction pour sélectionner une image depuis la galerie ou prendre une photo
  Future<void> _choisirImage() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Galerie'),
                onTap: () async {
                  final pickedFile =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      _image = File(pickedFile.path);
                    });
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Caméra'),
                onTap: () async {
                  final pickedFile =
                      await _picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    setState(() {
                      _image = File(pickedFile.path);
                    });
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Fonction pour choisir la date
  Future<void> _choisirDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        dateController.text =
            DateFormat('dd-MM-yyyy').format(pickedDate); // Format de date
      });
    }
  }

  // submit the form
  Future<void> _submitForm() async {
    String? photoURL;
    if (_image != null) {
      photoURL = await _service.uploadImage(_image!);
    }

    ObjetPerdu objet = ObjetPerdu(
      description: objetController.text,
      details: infoSuppController.text,
      photoURL: photoURL,
      lieu: lieuController.text,
      date: dateController.text,
      estTrouve: 0,
      idUser: currentUser?.email,
    );

    await _service.addLostObject(objet);

    // clear the form
    objetController.clear();
    lieuController.clear();
    dateController.clear();
    infoSuppController.clear();
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                    child: Text(
                  "Objets perdus",
                  style: TextStyle(fontSize: 25),
                )),
                const SizedBox(
                  height: 40,
                ),
                // Formulaire
                const Text(
                  'Signaler un objet perdu',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Qu'avez vous perdu ?",
                  style: TextStyle(fontFamily: 'InterRegular'),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 35,
                  child: TextField(
                    controller: objetController,
                    decoration: const InputDecoration(
                      fillColor: grisClair,
                      filled: true,
                      labelText: "Objet",
                      labelStyle:
                          TextStyle(fontFamily: 'InterMedium', fontSize: 13),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Où avez vous perdu cet objet ?",
                  style: TextStyle(fontFamily: 'InterRegular'),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 35,
                  child: TextField(
                    controller: lieuController,
                    decoration: const InputDecoration(
                      fillColor: grisClair,
                      filled: true,
                      labelText: "Lieu",
                      labelStyle:
                          TextStyle(fontFamily: 'InterMedium', fontSize: 13),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Quand l'avez vous perdu ?",
                  style: TextStyle(fontFamily: 'InterRegular'),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 35,
                  child: TextField(
                    controller: dateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      fillColor: grisClair,
                      filled: true,
                      labelText: "Date",
                      labelStyle: const TextStyle(
                          fontFamily: 'InterMedium', fontSize: 13),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: _choisirDate, // Ouvre le calendrier
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Informations supplémentaires ?",
                  style: TextStyle(fontFamily: 'InterRegular'),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: infoSuppController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    fillColor: grisClair,
                    filled: true,
                    labelText: "Informations supplémentaires",
                    labelStyle: TextStyle(
                      fontFamily: 'InterMedium',
                      fontSize: 13,
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton.icon(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        grisClair), // Couleur personnalisée
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8.0), // Bordure personnalisée
                      ),
                    ),
                  ),
                  onPressed:
                      _choisirImage, // Appel de la fonction pour choisir l'image
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Colors.black,
                  ),
                  label: const Text(
                    "Attacher une photo",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                _image != null
                    ? Image.file(
                        _image!,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.image_not_supported, size: 50),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (objetController.text == '') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Donnez un nom à l'objet svp",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            elevation: 2,
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }
                      // Code pour soumettre le formulaire
                      await _submitForm();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Objet Signalé avec succès!",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          elevation: 2,
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          const Color.fromRGBO(244, 171, 90, 1)),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Bordure personnalisée
                        ),
                      ),
                    ),
                    child: const Text(
                      "Signaler",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                // Chercher un objet perdu
                const SizedBox(height: 32),
                const Text(
                  'Liste des objets perdus',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 30,
                  width: 200,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      fillColor: grisClair,
                      filled: true,
                      labelText: "Chercher",
                      labelStyle: const TextStyle(
                          fontFamily: 'InterMedium', fontSize: 13),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30)),
                      prefixIcon: const Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value.toLowerCase();
                      });
                    },
                  ),
                ),

                // Liste des objets perdus
                const SizedBox(height: 16),
                StreamBuilder<QuerySnapshot>(
                  stream: _service.getLostObjects(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Column(
                          children: [
                            const Text('Erreur de chargement'),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {});
                              },
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                    const Color.fromRGBO(244, 171, 90, 1)),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        8.0), // Bordure personnalisée
                                  ),
                                ),
                              ),
                              child: const Text(
                                "Réessayer",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (!snapshot.hasData) {
                      return const Center(
                        child: Text(
                          "Aucun objet perdu n'est encore signalé",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      );
                    } else {
                      final lostObjects = snapshot.data!.docs;

                      // Search filtering based on a potential search query
                      final filteredObjects = lostObjects.where((doc) {
                        var data = doc.data() as Map<String, dynamic>;
                        var description = data['description']?.toLowerCase();
                        return description.contains(_searchQuery);
                      }).toList();

                      if (filteredObjects.isEmpty) {
                        return const Center(
                          child: Text('Aucun objet trouvé.'),
                        );
                      }

                      return SizedBox(
                          height: 500,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  2, // Nombre d'objets par ligne (2 ou 3)
                              crossAxisSpacing:
                                  8.0, // Espace horizontal entre les objets
                              mainAxisSpacing:
                                  8.0, // Espace vertical entre les objets
                              childAspectRatio:
                                  0.7, // Ratio largeur/hauteur pour chaque carte
                            ),
                            itemCount: filteredObjects.length,
                            itemBuilder: (context, index) {
                              var lostObject = filteredObjects[index].data()
                                  as Map<String, dynamic>;
                              String description =
                                  lostObject['description'] ?? 'No description';
                              String lieu =
                                  lostObject['lieu'] ?? 'Unknown location';
                              String date =
                                  lostObject['date'] ?? 'Unknown date';
                              String? photoUrl = lostObject[
                                  'photoURL']; // Nullable: May not have a photo
                              bool estTrouve = lostObject['etat'] != 0;

                              return Card(
                                color: eptLightOrange,
                                margin: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (photoUrl != null)
                                        Image.network(
                                          photoUrl,
                                          height:
                                              120, // Ajustement de la hauteur pour correspondre à la grille
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        )
                                      else
                                        Container(
                                          height:
                                              120, // Ajustement de la hauteur
                                          color: eptLightOrange,
                                          child: const Center(
                                            child: Icon(
                                                Icons.image_not_supported,
                                                size: 50),
                                          ),
                                        ),
                                      const SizedBox(height: 8),
                                      Text(
                                        description,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                        maxLines:
                                            1, // Limite de ligne pour éviter trop de texte
                                        overflow: TextOverflow
                                            .ellipsis, // Texte trop long coupé avec '...'
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.place,
                                            size: 15,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            lieu == '' ? 'unknown' : lieu,
                                            style: const TextStyle(
                                              fontSize: 10,
                                              fontFamily: 'InterRegular',
                                            ),
                                            maxLines: 1, // Limite de ligne
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.calendar_month,
                                            size: 15,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            date == '' ? 'unknown' : date,
                                            style: const TextStyle(
                                              fontSize: 10,
                                              fontFamily: 'InterRegular',
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.person,
                                            size: 15,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            lostObject['idUser'] ?? 'Inconnu',
                                            style: const TextStyle(
                                              fontSize: 10,
                                              fontFamily: 'InterRegular',
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              estTrouve
                                                  ? const Text(
                                                      'Trouvé',
                                                      style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 10,
                                                      ),
                                                    )
                                                  : const Text(
                                                      'Non Trouvé',
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                            width: 35,
                                            child: Transform.scale(
                                              scale: 0.5,
                                              child: Switch(
                                                activeColor: Colors.green,
                                                value: 1 == lostObject['etat'],
                                                onChanged: currentUser ==
                                                            null ||
                                                        currentUser!.email !=
                                                            lostObject['idUser']
                                                    ? (_) {}
                                                    : (value) async {
                                                        await _service
                                                            .toggleFoundStatus(
                                                                lostObjects[
                                                                        index]
                                                                    .id,
                                                                value ? 1 : 0);
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              value
                                                                  ? 'Objet marqué comme trouvé!'
                                                                  : 'Objet marqué comme perdu!',
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            backgroundColor:
                                                                Colors.green,
                                                          ),
                                                        );
                                                      },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )

                          // ListView.builder(
                          //   itemCount: lostObjects.length,
                          //   itemBuilder: (context, index) {
                          //     var lostObject =
                          //         lostObjects[index].data() as Map<String, dynamic>;
                          //     String description =
                          //         lostObject['description'] ?? 'No description';
                          //     String lieu =
                          //         lostObject['lieu'] ?? 'Unknown location';
                          //     String? photoUrl = lostObject[
                          //         'photoURL']; // Nullable: May not have a photo
                          //     bool estTrouve = lostObject['etat'] != 0;

                          //     return Card(
                          //       margin: EdgeInsets.all(8.0),
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(8.0),
                          //         child: Column(
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           children: [
                          //             if (photoUrl != null)
                          //               Image.network(photoUrl,
                          //                   height: 150,
                          //                   width: double.infinity,
                          //                   fit: BoxFit.cover)
                          //             else
                          //               Container(
                          //                 height: 150,
                          //                 color: Colors.grey[300],
                          //                 child: Center(
                          //                     child: Icon(Icons.image_not_supported,
                          //                         size: 50)),
                          //               ),
                          //             SizedBox(height: 8),
                          //             Text(description,
                          //                 style: TextStyle(
                          //                     fontWeight: FontWeight.bold,
                          //                     fontSize: 18)),
                          //             Text(lieu,
                          //                 style: TextStyle(color: Colors.grey)),
                          //             SizedBox(height: 8),
                          //             Row(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.spaceBetween,
                          //               mainAxisSize: MainAxisSize.max,
                          //               children: [
                          //                 Row(
                          //                   mainAxisSize: MainAxisSize.min,
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.start,
                          //                   children: [
                          //                     const Text('Statut: '),
                          //                     estTrouve
                          //                         ? Text(
                          //                             'Trouvé',
                          //                             style: TextStyle(
                          //                                 color: Colors.green),
                          //                           )
                          //                         : Text(
                          //                             'Non Trouvé',
                          //                             style: TextStyle(
                          //                                 color: Colors.red),
                          //                           ),
                          //                   ],
                          //                 ),
                          //                 Switch(
                          //                   activeColor: Colors.green,
                          //                   value: 1 == lostObject['etat'],
                          //                   onChanged: currentUser == null ||
                          //                           currentUser!.email !=
                          //                               lostObject['idUser']
                          //                       ? (_) {}
                          //                       : (value) async {
                          //                           await _service
                          //                               .toggleFoundStatus(
                          //                                   lostObjects[index].id,
                          //                                   value ? 1 : 0);
                          //                           ScaffoldMessenger.of(context)
                          //                               .showSnackBar(
                          //                             SnackBar(
                          //                               content: Text(
                          //                                 value
                          //                                     ? 'Objet marqué comme trouvé!'
                          //                                     : 'Objet marqué comme perdu!',
                          //                                 style: TextStyle(
                          //                                     fontWeight:
                          //                                         FontWeight.bold),
                          //                               ),
                          //                               backgroundColor:
                          //                                   Colors.green,
                          //                             ),
                          //                           );
                          //                         },
                          //                 )
                          //               ],
                          //             ),
                          //             Text(
                          //                 'Date: ${lostObject['date'] ?? 'Unknown'}'),
                          //             SizedBox(height: 8),
                          //             Row(
                          //               mainAxisAlignment: MainAxisAlignment.start,
                          //               children: [
                          //                 Text('Signalé par:'),
                          //                 SizedBox(width: 10),
                          //                 Text(
                          //                   lostObject['idUser'] ?? 'Inconnu',
                          //                   style:
                          //                       TextStyle(color: Colors.grey[600]),
                          //                 )
                          //               ],
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //     );
                          //   },
                          // ),

                          );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
