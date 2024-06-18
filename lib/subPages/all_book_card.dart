import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_lbrary/subPages/all_book_detail.dart';

class AllBookCard extends StatefulWidget {
  final String imgUrl;
  final String title;
  final String author;
  final String publisher;
  final String publishedYear;
  final String page;
  final String id;
  AllBookCard(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.author,
      required this.publisher,
      required this.publishedYear,
      required this.page,
      required this.id});

  @override
  State<AllBookCard> createState() => _AllBookCardState();
}

class _AllBookCardState extends State<AllBookCard> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.0,
      height: 200.0,
      child: Card(
        color: const Color(0xFFebdede),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: _fileExists
                    ? Image.file(
                        File(widget.imgUrl),
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.red,
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 7.0,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: 20.0,
              width: 120.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AllBookDetail(imgUrl: widget.imgUrl, title: widget.title, author: widget.author, publisher: widget.publisher, publishedYear: widget.publishedYear, page: widget.page, id: widget.id),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFb8f397)),
                ),
                child: const Text(
                  "SPECIFY",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 7.0,
            ),
          ],
        ),
      ),
    );
  }
}
