import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:polyapp/fonctions.dart';
import 'package:polyapp/models/enums/role_type.dart';
import 'package:polyapp/models/utilisateur.dart';
import 'package:polyapp/pages/homepage/homepage.dart';
import 'package:polyapp/pages/authentification/login.dart';
import 'package:polyapp/services/user_service.dart';
import 'package:polyapp/util/app_colors.dart';
import 'package:polyapp/util/constante.dart';
import 'package:polyapp/widgets/alerte_message.dart';

class Inscription extends StatelessWidget {
  Inscription({super.key});
  final UserService _userService = UserService();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _promoController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> _isSaving = ValueNotifier<bool>(false);

  final ValueNotifier<double> _strengthNotifier = ValueNotifier<double>(0);
  final ValueNotifier<bool> _passwordsMatchNotifier = ValueNotifier<bool>(true);

  // Fonction pour calculer la force du mot de passe
  void _checkPasswordStrength(String password) {
    double strength = 0;

    // Critère 1: Longueur du mot de passe
    if (password.length >= 8) strength += 0.25;

    // Critère 2: Présence d'une lettre majuscule
    if (password.contains(RegExp(r'[A-Z]'))) strength += 0.25;

    // Critère 3: Présence d'un chiffre
    if (password.contains(RegExp(r'[0-9]'))) strength += 0.25;

    // Critère 4: Présence d'un caractère spécial
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength += 0.25;

    // Mise à jour de la valeur dans le ValueNotifier
    _strengthNotifier.value = strength;
  }

  void _checkPasswordsMatch() {
    _passwordsMatchNotifier.value =
        _passwordController.text == _confirmPasswordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                  SvgPicture.asset(
                    "assets/connection-inscription/ept-login-logo.svg",
                    fit: BoxFit.fitHeight,
                    height: 200,
                    color: eptLogoOrange,
                  ),
                  ],
                ),
                // Title
                Row(
                  children: [
                    Text(
                      'Inscription',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                // Subtitle
                Row(
                  children: [
                    Text(
                      'Vos premiers pas dans la vie polytechnicienne',
                      style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).width * 0.035,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Nom TextField
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nomController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Entrer un nom valide';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Nom',
                              labelStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),

                          // Prenom TextField
                          TextFormField(
                            controller: _prenomController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Entrer un prénom valide';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Prénom',
                              labelStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          // Mail TextField
                          TextFormField(
                            controller: _telephoneController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Entrer un numéro valide';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: 'Téléphone',
                              labelStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          // Mail TextField
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Entrer un mail valide';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Mail',
                              labelStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          // Mot de passe TextField
                          TextFormField(
                            controller: _passwordController,
                            obscureText:
                                true, // Cache le texte pour le champ mot de passe
                            onChanged: (value) {
                              _checkPasswordStrength(
                                  value); // Appel lors de la saisie
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Entrer un password valide';
                              } else
                              // Vérifier la longueur du password
                              if (value.length < 8) {
                                return 'Le password doit contenir au moins 8 caractères';
                              } else
                              // Vérifier la présence d'au moins une lettre majuscule
                              if (!value.contains(RegExp(r'[A-Z]'))) {
                                return 'Le password doit contenir au moins une majuscule';
                              } else
                              // Vérifier la présence d'au moins un chiffre
                              if (!value.contains(RegExp(r'[0-9]'))) {
                                return 'Le password doit contenir au moins un chiffre';
                              } else
                              // Vérifier la présence d'au moins un caractère spécial
                              if (!value.contains(
                                  RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                                return 'Le password doit contenir au moins un caractère spécial';
                              } else {
                                return null;
                              }
                            },

                            decoration: InputDecoration(
                              labelText: 'Mot de passe',
                              labelStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          // Confirmer mot de passe TextField
                          // Utilisation de ValueListenableBuilder pour écouter les changements de _strengthNotifier
                          ValueListenableBuilder<double>(
                            valueListenable: _strengthNotifier,
                            builder: (context, strength, child) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Affichage de la barre de progression
                                  LinearProgressIndicator(
                                    borderRadius: BorderRadius.circular(10),
                                    value:
                                        strength, // Valeur de la force (entre 0.0 et 1.0)
                                    backgroundColor: Colors.grey[300],
                                    color: strength <= 0.5
                                        ? Colors.red
                                        : (strength <= 0.75
                                            ? Colors.orange
                                            : Colors.green),
                                    minHeight: 10,
                                  ),
                                  SizedBox(height: 10),
                                  // Affichage textuel de la force
                                  Text(
                                    strength <= 0.25
                                        ? 'Mot de passe faible'
                                        : (strength <= 0.5
                                            ? 'Mot de passe moyen'
                                            : (strength <= 0.75
                                                ? 'Mot de passe fort'
                                                : 'Mot de passe très fort')),
                                    style: TextStyle(
                                        color: strength <= 0.5
                                            ? Colors.red
                                            : (strength <= 0.75
                                                ? Colors.orange
                                                : Colors.green)),
                                  ),
                                ],
                              );
                            },
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _confirmPasswordController,
                            onChanged: (value) {
                              _checkPasswordsMatch();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Entrer un mot de passe valide';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Confirmer mot de passe',
                              labelStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),

                          ValueListenableBuilder<bool>(
                            valueListenable: _passwordsMatchNotifier,
                            builder: (context, passwordsMatch, child) {
                              return Text(
                                passwordsMatch
                                    ? 'Les mots de passe correspondent'
                                    : 'Les mots de passe ne correspondent pas',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: passwordsMatch
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // Promotion TextField
                          TextFormField(
                            controller: _promoController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Entrer un promo valide';
                              } else if (![
                                "30",
                                "31",
                                "32",
                                "33",
                                "34",
                                "35",
                                "36",
                                "37",
                                "38",
                                "39",
                                "40",
                                "41",
                                "42",
                                "43",
                                "44",
                                "45",
                                "46",
                                "47",
                                "48",
                                "49",
                                "50",
                                "51",
                                "52",
                                "53",
                                "54",
                                "55",
                                "56",
                                "57",
                                "58",
                                "59",
                                "60"
                              ].contains(value)) {
                                return "Promo invalide";
                              }

                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Promotion',
                              labelStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          // S'inscrire Button
                          ValueListenableBuilder<bool>(
                              valueListenable: _isSaving,
                              builder: (context, isSaving, child) {
                                return isSaving
                                    ? CircularProgressIndicator()
                                    : ElevatedButton(
                                        onPressed: () async {
                                          // Action lors de l'inscription
                                          _isSaving.value = true;
                                          if (_formKey.currentState!
                                              .validate()) {
                                            try {
                                              User? user = await _userService
                                                  .signUpWithEmailAndPassword(
                                                _emailController.text.trim(),
                                                _passwordController.text.trim(),
                                              );

                                              if (user != null) {
                                                Utilisateur utilisateur =
                                                    new Utilisateur(
                                                        id: _emailController
                                                            .value.text,
                                                        username:
                                                            _emailController
                                                                .value.text,
                                                        // password: _passwordController
                                                        //     .value.text,
                                                        prenom: _prenomController
                                                            .value.text,
                                                        nom: _nomController
                                                            .value.text,
                                                        email: _emailController
                                                            .value.text,
                                                        telephone:
                                                            _telephoneController
                                                                .value.text,
                                                        photo: "",
                                                        genie: "",
                                                        promo:
                                                            "#${_promoController.value.text}",
                                                        role: RoleType.ADMIN);
                                                await _userService.setRole(
                                                    RoleType.USER
                                                        .toString()
                                                        .split('.')
                                                        .last);
                                                try {
                                                  String code =
                                                      await _userService
                                                          .ajouterUser(
                                                              utilisateur);
                                                  if (code == "OK") {
                                                    changerPage(
                                                        context, Homepage());
                                                  }
                                                } catch (e) {}
                                              }
                                            } catch (e) {
                                              alerteMessageWidget(
                                                  context,
                                                  "Mot de passe ou email invalide.",
                                                  AppColors.echec);
                                            }
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: orange,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 100, vertical: 15),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                        child: Text(
                                          "S'inscrire",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      );
                              }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Déjà inscrit? "),
                              TextButton(
                                onPressed: () {
                                  changerPage(context, Login());
                                },
                                child: Text(
                                  'connectez vous',
                                  style: TextStyle(
                                    color: orange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
