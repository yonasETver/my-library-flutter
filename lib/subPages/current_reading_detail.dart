// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_lbrary/pages/current-reading-book.dart';
import 'package:my_lbrary/top_bar.dart';

// ignore: must_be_immutable
class CurrentReadDetail extends StatefulWidget {
  String imgUrl;
  CurrentReadDetail({super.key, required this.imgUrl});

  @override
  State<CurrentReadDetail> createState() => _CurrentReadDetailState();
}

class _CurrentReadDetailState extends State<CurrentReadDetail> {
  bool isSwitched = false;
  bool isSwitchedTwo = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const CurrentBook()));
                  },
                  child: const Icon(
                    Icons.arrow_circle_left,
                    color: Colors.black,
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                    child: Center(child: Text("THIS BOOK STATUS")),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    widget.imgUrl,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      const Text("Finished"),
                      const SizedBox(
                        width: 10,
                      ),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeColor:
                            Colors.green, // Set the color when the switch is ON
                        inactiveThumbColor:
                            Colors.red, // Set the color when the switch is OFF
                      ),
                    ],
                  )),
                  const Text("Make FAV"),
                  const SizedBox(
                    width: 10,
                  ),
                  Switch(
                    value: isSwitchedTwo,
                    onChanged: (value) {
                      setState(() {
                        isSwitchedTwo = value;
                      });
                    },
                    activeColor:
                        Colors.green, // Set the color when the switch is ON
                    inactiveThumbColor:
                        Colors.red, // Set the color when the switch is OFF
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
