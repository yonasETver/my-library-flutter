// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:my_lbrary/pages/all-book.dart';
import 'package:my_lbrary/pages/current-reading-book.dart';
import 'package:my_lbrary/pages/aready-read-book.dart';
import 'package:my_lbrary/pages/my-wish-list.dart';
import 'package:my_lbrary/pages/my-fav.dart';
import 'package:my_lbrary/pages/about.dart';
import 'top_bar.dart';
import 'package:my_lbrary/subPages/camera.dart';
import 'package:my_lbrary/subPages/gallery.dart';

void main() => runApp(
      const MaterialApp(
        home: Home(),
      ),
    );

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int colorForGound = 0xFF000000;
  int colorBackGround = 0XFFb8f397;
  double rotationAngle = 0.0;
  bool isWidgetVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child: Image.asset(
                    'assets/logo.png', // Update this path based on your project structure
                    fit: BoxFit.fill,
                    height: 220.0,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 6.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AllBook()));
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(colorBackGround)),
                            ),
                            child: Text(
                              "SEE ALL BOOKS",
                              style: TextStyle(color: Color(colorForGound)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 6.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CurrentBook()));
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(colorBackGround)),
                            ),
                            child: Text(
                              "CURRENT READING BOOKS",
                              style: TextStyle(color: Color(colorForGound)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 6.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AreadyRead()));
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(colorBackGround)),
                            ),
                            child: Text(
                              "AREADY READ BOOKS",
                              style: TextStyle(color: Color(colorForGound)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 6.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyWish()));
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(colorBackGround)),
                            ),
                            child: Text(
                              "MY WISH LIST",
                              style: TextStyle(color: Color(colorForGound)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 6.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Stack(children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Container(
                                width: 360.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MyFav()));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(colorBackGround)),
                                  ),
                                  child: Text(
                                    "MY FAVORITES BOOKS",
                                    style:
                                        TextStyle(color: Color(colorForGound)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 5.0,
                              right: 5.0,
                              child: Container(
                                height: 40.0,
                                width: 50.0,
                                child: Visibility(
                                  visible: isWidgetVisible,
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Gallery()));
                                    },
                                    backgroundColor: const Color(0xff5bead8),
                                    child: const Icon(
                                      Icons.photo_size_select_actual_outlined,
                                      color: Colors.grey,
                                      size: 30.0,
                                    ),
                                  ),
                                ),
                              ))
                        ]),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Container(
                                width: 360.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const About()));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(colorBackGround)),
                                  ),
                                  child: Text(
                                    "About",
                                    style: TextStyle(color: Color(colorForGound)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 5.0,
                              right: 5.0,
                              child: Container(
                                height: 40.0,
                                width: 50,
                                child: Visibility(
                                  visible: isWidgetVisible,
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Camera()));
                                    },
                                    backgroundColor: const Color(0xff5bead8),
                                    child: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.grey,
                                      size: 30.0,
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            // Change the rotation angle when clicked
                            rotationAngle += 45.0;
                            isWidgetVisible = !isWidgetVisible;
                          });
                        },
                        backgroundColor: const Color(0xFFfb5353),
                        child: Transform.rotate(
                          angle: rotationAngle *
                              0.0174533, // Convert degrees to radians
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
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
    );
  }
}
