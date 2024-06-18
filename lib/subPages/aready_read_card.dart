// ignore_for_file: sized_box_for_whitespace, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class AreadyReadCard extends StatefulWidget {
  //const AreadyReadCard({Key? key}) : super(key: key);
  String imgUrl;
  String data;
  AreadyReadCard({super.key, 
    required this.imgUrl,
    required this.data,
  });

  @override
  State<AreadyReadCard> createState() => _AreadyReadCardState();
}

class _AreadyReadCardState extends State<AreadyReadCard> {
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
              flex: 5,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                  child: Image.asset(
                    widget
                        .imgUrl, // Update this path based on your project structure
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
                    color: Color(0xFFb8f397)),
                alignment: Alignment.center,
                child: Text(
                  widget.data,
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
    );
  }
}
