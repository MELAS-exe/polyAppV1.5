import 'package:flutter/material.dart';
import 'package:polyapp/drawer.dart';
import 'package:polyapp/pages/homepage/jeux/jeux.dart';
import 'package:polyapp/pages/homepage/nouveaute.dart';
import 'package:polyapp/pages/homepage/top.dart';
import 'package:polyapp/pages/homepage/blog/blog.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const TopRow(),
                  const SizedBox(height: 20),
                  const Nouveaute(),
                  const SizedBox(height: 20),
                  const JeuxHomepage(),
                  const SizedBox(height: 20),
                  Container(
                    width: 300,
                    height: 2,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  const Blog(),
                ],
              ),
            )));
  }
}
