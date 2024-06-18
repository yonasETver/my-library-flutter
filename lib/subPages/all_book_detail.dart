import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_lbrary/pages/all-book.dart';
import 'package:my_lbrary/top_bar.dart';
import 'dart:io';

class AllBookDetail extends StatefulWidget {
  final String imgUrl;
  final String title;
  final String author;
  final String publisher;
  final String publishedYear;
  final String page;
  final String id;
  const AllBookDetail(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.author,
      required this.publisher,
      required this.publishedYear,
      required this.page,
      required this.id});

  @override
  State<AllBookDetail> createState() => _AllBookDetailState();
}

class _AllBookDetailState extends State<AllBookDetail> {
  bool _fileExists = false;

  @override
  void initState() {
    super.initState();
    _checkFileExists();
  }

  Future<void> _checkFileExists() async {
    File file = File(widget.imgUrl);
    bool exists = await file.exists();
    setState(() {
      _fileExists = exists;
    });
  }

  bool isWidgetVisible = false;
  double rotationAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15.0),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AllBook()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Icon(
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
                        "BOOK DETAILS",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10, 0.0),
                      child: Container(
                        height: 640.0,
                        child: _fileExists
                            ? Image.file(
                                File(widget.imgUrl),
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(
                                    child: Icon(
                                      Icons.broken_image,
                                      color: Colors.red,
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: Icon(
                                  Icons.image_not_supported,
                                  color: Colors.grey,
                                ),
                              ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 210,
                          color: const Color(0xFFb8f397),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Title: " + widget.title),
                                Text("Author: " + widget.author),
                                Text("Publisher: " + widget.publisher),
                                Text("Publisher year: " + widget.publishedYear),
                                Text("Total page: " + widget.page),
                              ],
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            // Non-clickable button
                            Positioned(
                              bottom: -5.0, // Adjust the position as needed
                              right: 0.0,
                              // Adjust the position as needed
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Change the radius value as needed
                                  color: Color(
                                      0xFFb8f397), // Container background color
                                ),
                                child: ElevatedButton(
                                  onPressed:
                                      null, // Set onPressed to null to make it non-clickable
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 105.0, vertical: 20.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      // Adjust border radius as needed
                                    ),
                                  ),
                                  child: const Text(
                                    '',
                                  ),
                                ),
                              ),
                            ),
                            // Floating action button
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 30.0, 10.0, 0.0),
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      rotationAngle += 45.0;
                                      isWidgetVisible = !isWidgetVisible;
                                    });
                                  },
                                  backgroundColor: const Color(0xFFb8f397),
                                  child: Transform.rotate(
                                    angle: rotationAngle *
                                        0.0174533, // Convert degrees to radians
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                          child: Container(
                            width: 210.0,
                            child: Visibility(
                              visible: isWidgetVisible,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFb8f397),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                                child: const Text(
                                  "START READING",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
                          child: Container(
                            width: 210.0,
                            child: Visibility(
                              visible: isWidgetVisible,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFb8f397),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                                child: const Text(
                                  "MAKE WISH LIST",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
