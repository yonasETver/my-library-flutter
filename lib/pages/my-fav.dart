// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_lbrary/main.dart';
import 'package:my_lbrary/top_bar.dart';
import 'package:my_lbrary/subPages/fav_caed.dart';

class MyFav extends StatefulWidget {
  const MyFav({super.key});

  @override
  State<MyFav> createState() => _MyFavState();
}

class _MyFavState extends State<MyFav> {
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
                    child: const Icon(Icons.arrow_circle_left)),
              ),
              const Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 40.0),
                    child: Text(
                      'FAVARITIES BOOK',
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
                                FavCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Book title\nAuthor\nPage #",
                                ),
                                FavCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Book title\nAuthor\nPage #",
                                ),
                                FavCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Book title\nAuthor\nPage #",
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FavCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Book title\nAuthor\nPage #",
                                ),
                                FavCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Book title\nAuthor\nPage #",
                                ),
                                FavCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Book title\nAuthor\nPage #",
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FavCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Book title\nAuthor\nPage #",
                                ),
                                FavCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Book title\nAuthor\nPage #",
                                ),
                                FavCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Book title\nAuthor\nPage #",
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FavCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Book title\nAuthor\nPage #",
                                ),
                                FavCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Book title\nAuthor\nPage #",
                                ),
                                FavCard(
                                  imgUrl: "assets/coverPhoto.png",
                                  data: "Book title\nAuthor\nPage #",
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
