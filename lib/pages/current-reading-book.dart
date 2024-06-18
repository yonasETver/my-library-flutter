// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_lbrary/main.dart';
import 'package:my_lbrary/top_bar.dart';
import 'package:my_lbrary/subPages/current_reding_card.dart';

class CurrentBook extends StatefulWidget {
  const CurrentBook({super.key});

  @override
  State<CurrentBook> createState() => _CurrentBookState();
}

class _CurrentBookState extends State<CurrentBook> {
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
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                  child: const Icon(
                    Icons.arrow_circle_left,
                    color: Colors.black,
                  ),
                ),
              ),
              const Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 40.0),
                    child: Text(
                      'CURRENT READING BOOKS',
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
                      return const Padding(
                        padding:
                            EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 0.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CurrentBookCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data:
                                      "Reading started\n10\\19\\2023\n5:30 AM",
                                ),
                                CurrentBookCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data:
                                      "Reading started\n10\\19\\2023\n5:30 AM",
                                ),
                                CurrentBookCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data:
                                      "Reading started\n10\\19\\2023\n5:30 AM",
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CurrentBookCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data:
                                      "Reading started\n10\\19\\2023\n5:30 AM",
                                ),
                                CurrentBookCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data:
                                      "Reading started\n10\\19\\2023\n5:30 AM",
                                ),
                                CurrentBookCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data:
                                      "Reading started\n10\\19\\2023\n5:30 AM",
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CurrentBookCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data:
                                      "Reading started\n10\\19\\2023\n5:30 AM",
                                ),
                                CurrentBookCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data:
                                      "Reading started\n10\\19\\2023\n5:30 AM",
                                ),
                                CurrentBookCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data:
                                      "Reading started\n10\\19\\2023\n5:30 AM",
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CurrentBookCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data:
                                      "Reading started\n10\\19\\2023\n5:30 AM",
                                ),
                                CurrentBookCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data:
                                      "Reading started\n10\\19\\2023\n5:30 AM",
                                ),
                                CurrentBookCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data:
                                      "Reading started\n10\\19\\2023\n5:30 AM",
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
