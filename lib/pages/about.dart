// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:my_lbrary/top_bar.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: Column(
        children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0.0,10.0,0.0,20.0),
          child: Center(
            child: Text(
                "ABOUT THE APP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
          Container(
            height: 100.0,
            width: 100.0,
            child: Image.asset("assets/logo.png"),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
            child: Text(
                "Mt Library",
              style: TextStyle(
                fontSize: 16.0
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(50.0,0.0,50.0,15.0),
            child: Text(
                "This app help you to make list of book you want to read, make FAV, Wish list and follow progress.",
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(50.0,0.0,50.0,15.0),
            child: Text(
              "This app wishes to become top library site that has almost all books published",
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(50.0,0.0,50.0,15.0),
            child: Text(
              "This app designed and created by Yonas Tedela",
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(50.0,0.0,50.0,15.0),
            child: Text(
              "Address Addis Ababa, Ethiopia yonastedela63@gmail.com",
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(50.0,0.0,50.0,10.0),
            child: Text(
              "© [2023] [MakeSolvApp/school]. All rights reserved.",
              textAlign: TextAlign.center,
            ),
          ),
        ]

      ),
    );
  }
}
