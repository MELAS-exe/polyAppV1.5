import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:polyapp/pages/authentification/login.dart';
import 'package:polyapp/pages/homepage/homepage.dart';
import 'package:polyapp/pages/navbar/navbar.dart';
import 'package:polyapp/util/utils.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDateFormatting(
      'fr', null); // Initialisation de la locale française
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      home: NavBar(),
    );
  }
}
