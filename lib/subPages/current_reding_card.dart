// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:my_lbrary/subPages/current_reading_detail.dart';

class CurrentBookCard extends StatelessWidget {
  final String imgUrl;
  final String data;

  const CurrentBookCard({super.key, 
    required this.imgUrl,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CurrentReadDetail(imgUrl: "assets/coverPhoto.png")),
        );
      },
      child: Container(
        width: 110.0,
        height: 200.0,
        child: Card(
          color: const Color(0xFFebdede),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 5,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Image.asset(
                      imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                    color: Color(0xFFb8f397)
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    data,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 9.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
