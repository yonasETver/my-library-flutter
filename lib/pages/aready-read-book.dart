// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_lbrary/main.dart';
import 'package:my_lbrary/subPages/aready_read_card.dart';
import 'package:my_lbrary/top_bar.dart';

class AreadyRead extends StatefulWidget {
  const AreadyRead({super.key});

  @override
  State<AreadyRead> createState() => _AreadyReadState();
}

class _AreadyReadState extends State<AreadyRead> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: Column(
        children: [
          // Add Text widget above CustomScrollView
          const SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Icon(Icons.arrow_circle_left),
                  )),
              const Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 40.0),
                    child: Text(
                      'AREADY READ’S BOOK',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 0.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                AreadyReadCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Reading end\n10\\19\\2023\n5:30 AM",
                                ),
                                AreadyReadCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Reading end\n10\\19\\2023\n5:30 AM",
                                ),
                                AreadyReadCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Reading end\n10\\19\\2023\n5:30 AM",
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                AreadyReadCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Reading end\n10\\19\\2023\n5:30 AM",
                                ),
                                AreadyReadCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Reading end\n10\\19\\2023\n5:30 AM",
                                ),
                                AreadyReadCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Reading end\n10\\19\\2023\n5:30 AM",
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                AreadyReadCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Reading end\n10\\19\\2023\n5:30 AM",
                                ),
                                AreadyReadCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Reading end\n10\\19\\2023\n5:30 AM",
                                ),
                                AreadyReadCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Reading end\n10\\19\\2023\n5:30 AM",
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                AreadyReadCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Reading end\n10\\19\\2023\n5:30 AM",
                                ),
                                AreadyReadCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Reading end\n10\\19\\2023\n5:30 AM",
                                ),
                                AreadyReadCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Reading end\n10\\19\\2023\n5:30 AM",
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    childCount:
                        1, // Assuming you want only one item in the sliver list
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
