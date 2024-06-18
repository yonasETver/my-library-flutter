// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  //const TopBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool switchValue = false;

  String urls = "";

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFfb5353),
      leading: PopupMenuButton<String>(
        onSelected: (String result) {
          print("Selected ${result}...........");
        },
        offset: const Offset(0, 55),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'FontS',
            child: Row(
              children: [
                const Text("Font Size"),
                const SizedBox(
                  width: 30.0,
                ),
                PopupMenuButton<String>(
                  icon: const Icon(
                    Icons.arrow_right,
                    size: 30.0,
                    color: Colors.black,
                  ),
                  onCanceled: () {},
                  onSelected: (String result) {
                    // if (kDebugMode) {
                    //   // ignore: avoid_print
                    //   print("Selected ${result}...........");
                    // }
                  },
                  offset: const Offset(-100, -10),
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(value: 'F12', child: Text("12")),
                    const PopupMenuItem<String>(value: 'F13', child: Text("13")),
                    const PopupMenuItem<String>(value: 'F14', child: Text("14")),
                    const PopupMenuItem(value: 'F15', child: Text("15")),
                    const PopupMenuItem(value: 'F16', child: Text("16"))
                  ],
                ),
                const SizedBox(
                  width: 5.0,
                ),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'FontF',
            child: Row(
              children: [
                const Text("Font Family"),
                const SizedBox(
                  width: 15.0,
                ),
                PopupMenuButton<String>(
                  offset: const Offset(-100, -55),
                  icon: const Icon(
                    Icons.arrow_right,
                    size: 30.0,
                    color: Colors.black,
                  ),
                  onCanceled: () {},
                  onSelected: (String result) {
                    // if (kDebugMode) {
                    //   print("Selected ${result} ------");
                    // }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                        value: 'Fone', child: Text("Agbalumo")),
                    const PopupMenuItem<String>(
                        value: 'Ftwo', child: Text("Montserrat")),
                    const PopupMenuItem<String>(
                        value: 'Fthree', child: Text("Oswald")),
                    const PopupMenuItem(value: 'Ffour', child: Text("Lora")),
                    const PopupMenuItem(
                        value: 'Ffive', child: Text("Edu TAS Beginner"))
                  ],
                ),
                const SizedBox(
                  width: 5.0,
                ),
              ],
            ),
          ),
          PopupMenuItem(
              value: "Mode",
              child: Row(
                children: [
                  const Text("Night Mode"),
                  const SizedBox(
                    width: 15.0,
                  ),
                  PopupMenuButton<String>(
                    offset: const Offset(-100, -105),
                    icon: const Icon(
                      Icons.arrow_right,
                      size: 30.0,
                      color: Colors.black,
                    ),
                    onCanceled: () {},
                    onSelected: (String result) {
                      print("Selected ${result} >>>>");
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                          value: 'OFF',
                          child: Center(
                            child: Text(
                              "OFF",
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                ],
              )),
          PopupMenuItem(
            value: "Color",
            child: Row(
              children: [
                const Text("App Bar Color"),
                PopupMenuButton<String>(
                  offset: const Offset(-100, -153),
                  icon: const Icon(
                    Icons.arrow_right,
                    size: 30.0,
                    color: Colors.black,
                  ),
                  onCanceled: () {},
                  onSelected: (String result) {
                    print("Selected ${result} ******");
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'Purple',
                      child: ListTile(
                        title: Center(child: Text('Purpule')),
                        tileColor: Colors.purple,
                        textColor: Colors.white,
                      ),
                    ),
                    PopupMenuItem<String>(
                        value: 'Orange',
                        child: ListTile(
                          title: Container(
                            width: 100.0,
                            child: const Center(
                              child: Text(
                                "Orange",
                              ),
                            ),
                          ),
                          tileColor: Colors.orange,
                          textColor: Colors.white,
                        )),
                    const PopupMenuItem<String>(
                        value: 'Red',
                        child: ListTile(
                          title: Center(
                            child: Text(
                              "Red",
                            ),
                          ),
                          tileColor: Colors.red,
                          textColor: Colors.white,
                        )),
                    const PopupMenuItem(
                        value: 'Light-Blue',
                        child: ListTile(
                          title: Center(
                            child: Text(
                              "Light Blue",
                            ),
                          ),
                          tileColor: Color(0xFF38d5f7),
                          textColor: Colors.white,
                        )),
                  ],
                ),
              ],
            ),
          )
        ],
        child: const Icon(
          Icons.settings,
          color: Color.fromARGB(255, 6, 5, 5),
        ),
      ),
      actions: [
        Stack(alignment: Alignment.center, children: [
          IconButton(
            icon: const Icon(Icons.notifications_active),
            color: Colors.black,
            onPressed: () {
              // Handle the action for the first right icon
            },
          ),
          Positioned(
            left: 30,
            top: 10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10.0)),
              child: const Text(
                "9+",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ]),
        // Add PopupMenuButton for the settings icon
        PopupMenuButton<String>(
          onSelected: (String result) {
            // Handle the selection
          },
          offset: const Offset(0, 53),
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'BookSite',
              child: Row(
                children: [
                  const Text('Book Site'),
                  const SizedBox(
                    width: 10,
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.arrow_right,
                      size: 30.0,
                      color: Colors.black,
                    ),
                    offset: const Offset(50, 0),
                    onSelected: (String result) {
                      urls = result;
                      print("Selected ${result} //////");
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem<String>(
                        value: "siteone",
                        child: Text("PDF Drive"),
                      ),
                      const PopupMenuItem<String>(
                        value: "sitetwo",
                        child: Text("ManyBooks"),
                      ),
                      const PopupMenuItem<String>(
                          value: "sitethree", child: Text("Project Gutenberg")),
                      const PopupMenuItem<String>(
                        value: "sitefour",
                        child: Text("Open Library"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ],
      centerTitle: true,
      title: const Text(
        'My Book Library',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
