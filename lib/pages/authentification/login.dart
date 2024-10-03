import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:polyapp/pages/authentification/register.dart';
import 'package:polyapp/pages/navbar/navbar.dart';
import 'package:polyapp/pages/authentification/register.dart';
import 'package:polyapp/services/user_service.dart';
import 'package:polyapp/util/app_colors.dart';
import 'package:polyapp/util/constante.dart';
import 'package:polyapp/util/login_text_field.dart';
import 'package:polyapp/widgets/alerte_message.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final UserService _userService = UserService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/connection-inscription/login-background.png",
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: SvgPicture.asset(
                    "assets/connection-inscription/ept-login-logo.svg",
                    fit: BoxFit.fitHeight,
                    height: 330,
                    color: eptLogoOrange,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Connexion",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 0,
                ),
                const Text(
                  "Tous les services des Polytechniciens à portée de main.",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Login_TextField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrer un mail valide';
                        }
                        return null;
                      },
                      name: "Mail EPT",
                      inputType: TextInputType.emailAddress),
                ),
                Center(
                  child: Login_TextField(
                      name: "Mot de passe",
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrer un mot de passe valide valide';
                        }
                        return null;
                      },
                      inputType: TextInputType.text),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    InkWell(
                      onTap: () {},
                      child:  Text(
                        'Mot de passe oublié?',
                        style: TextStyle(
                            fontFamily: "Inter",
                            color: eptOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            decorationColor: eptOrange),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          User? user =
                              await _userService.signInWithEmailAndPassword(
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                          );
                          String? role = await _userService
                              .getUserRole(_emailController.text);
                          if (user != null && role != null) {
                            _userService.setRole(role);
                            Navigator.push(context, CupertinoPageRoute(builder: (context)=>const NavBar()));
                          }
                        } catch (e) {
                          alerteMessageWidget(
                              context,
                              "Mot de passe ou email invalide.",
                              AppColors.echec);
                        }
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 55,
                      decoration: BoxDecoration(
                          color: eptOrange,
                          borderRadius: BorderRadius.circular(40)),
                      child: const Center(
                          child: Text(
                        "Se connecter",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Pas de compte?",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => Inscription()));
                        },
                        child: const Text(
                          'Inscrivez vous!',
                          style: TextStyle(
                              fontFamily: "Inter",
                              color: eptOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              decorationColor: eptOrange),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
