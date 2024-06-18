// ignore_for_file: avoid_print, sized_box_for_whitespace, use_build_context_synchronously, unused_element, use_super_parameters, depend_on_referenced_packages, duplicate_ignore, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:my_lbrary/main.dart';
import 'package:my_lbrary/top_bar.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:my_lbrary/dbHelper.dart';
import 'package:intl/intl.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController publisherController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController pageNumberController = TextEditingController();
  TextEditingController imagePathController = TextEditingController();
  TextEditingController startDateController = TextEditingController();

  var flag = false;

  bool isNotANumber(String value) {
    try {
      int.parse(value);
      return false; // It's a number
    } catch (e) {
      return true; // It's not a number
    }
  }

  int titlColor = 0xffffffff;
  int authColor = 0xffffffff;
  int descColor = 0xffffffff;
  int pubColor = 0xffffffff;
  int pubYearColor = 0xffffffff;
  int pageColor = 0xffffffff;
  Color imgColor = Colors.grey.shade400;

  validate() {
    //for title validation
    if (titleController.text.toString().length <= 7) {
      titlColor = 0xffebf266;
      flag = false;
    } else {
      titlColor = 0xffffffff;
      flag = true;
    }

    //for autor validation
    if (authorController.text.toString().length <= 4) {
      authColor = 0xffebf266;
      flag = false;
    } else {
      authColor = 0xffffffff;
      flag = true;
    }

    //for description validation
    if (descriptionController.text.toString().length <= 14) {
      descColor = 0xffebf266;
      flag = false;
    } else {
      descColor = 0xffffffff;
      flag = true;
    }

    //for publisher validation
    if (publisherController.text.toString().length <= 4) {
      pubColor = 0xffebf266;
      flag = false;
    } else {
      pubColor = 0xffffffff;
      flag = true;
    }

    //for publisher validation
    String text = yearController.text;
    int year = 0;
    if (text.isEmpty) {
    } else {
      year = int.parse(text);
    }
    int currentYear = DateTime.now().year;
    if (yearController.text.toString().length != 4 ||
        isNotANumber(yearController.text) ||
        year < 1800 ||
        year > currentYear) {
      pubYearColor = 0xffebf266;
      flag = false;
    } else {
      pubYearColor = 0xffffffff;
      flag = true;
    }

    //for page number validation
    String pageTxt = pageNumberController.text;
    int pageNumber = 0;
    if (pageTxt.isEmpty) {
    } else {
      pageNumber = int.parse(pageTxt);
    }

    if (pageNumber <= 0 || pageNumber >= 4000) {
      pageColor = 0xffebf266;
      flag = false;
    } else {
      pageColor = 0xffffffff;
      flag = true;
    }

    if (_imageFile != null) {
      imgColor = Colors.grey.shade400;
      flag = true;
    } else {
      imgColor = Colors.yellow.shade400;
      flag = false;
    }
  }

  final dbHelper = MyDBHelper();
  String savedImagePath = "";
  String formattedDate = "";

  void _insertBook() async {
    try {
      // Wait for the database to be initialized
      final db = await dbHelper.database;

      // Ensure the database is open and valid
      if (db.isOpen) {
        // Now you can safely insert data into the database
        await dbHelper.insertData(
          titleController.text,
          authorController.text,
          descriptionController.text,
          publisherController.text,
          int.parse(yearController.text),
          int.parse(pageNumberController.text),
          savedImagePath,
          formattedDate,
        );

        // Show a message or navigate to another screen after insertion
        print('Data inserted successfully.');
        print("Title:....  ${titleController.text}");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        );
      } else {
        print('Database is not open.');
      }
    } catch (e) {
      print('Error inserting data: $e');
    }
  }

  // Future<void> fetchData() async {
  //   var data = await dbHelper.getAllData();
  //   print("Data: $data");
  //   // Now you can use the data fetched from the database
  // }

  // ignore: avoid_init_to_null
  File? _imageFile = null;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadImageFromAsset(); // Initialize image here
  }

  Future<void> _loadImageFromAsset() async {
    final ByteData data = await rootBundle.load('assets/photPlace.png');
    final buffer = data.buffer;
    final tempDir = await getTemporaryDirectory();
    final tempFile = await File('${tempDir.path}/photPlace.png').writeAsBytes(
      buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
    );
    setState(() {
      _imageFile = tempFile;
    });
  }

  Future<void> _getImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _imageFile = File(image.path);
          _saveImage();
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> _saveImage() async {
    if (_imageFile != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final savedImage = await _imageFile!.copy('${appDir.path}/$fileName.png');
      savedImagePath = '${appDir.path}/$fileName.png';
      // You can use `savedImage` for further operations or UI display
      print('Image saved: ${savedImage.path}');
    } else {
      print('No image available to save.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          child: Column(
            children: [
              Container(
                height: 80.0,
                width: 160.0,
                child: _imageFile != null
                    ? Image.file(
                        _imageFile!,
                        fit: BoxFit.fill,
                      )
                    : Placeholder(
                        color: Colors.grey
                            .shade400), // Placeholder widget or any other loading indicator
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: 400.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _getImageFromGallery();
                      },
                      child: const Text(
                        "Get Book Image From Gallery",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFb8f397)),
                        side: MaterialStateProperty.resolveWith((states) {
                          return const BorderSide(
                              color: Colors.black, width: 1.0);
                        }),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                16.0), // Optional: Add border radius
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  height: 30.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Set the border color
                      width: 1.0, // Set the border width
                    ),
                    borderRadius: BorderRadius.circular(
                        8.0), // Optional: Add border radius
                  ),
                  child: const Center(
                    child: Text(
                      "Enter Book Details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                child: Container(
                  width: 400.0,
                  child: const Text(
                    "Title",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: Container(
                  width: 400.0,
                  child: Container(
                    color: Color(titlColor),
                    child: TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        hintText: 'Enter book title', // The hint text
                        hintStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: 400.0,
                  child: const Text(
                    "Author",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: 400.0,
                  child: Container(
                    color: Color(authColor),
                    child: TextField(
                      controller: authorController,
                      decoration: const InputDecoration(
                        hintText: 'Enter book author', // The hint text
                        hintStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: 400.0,
                  child: const Text(
                    "Description",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: 400.0,
                  child: Container(
                    color: Color(descColor),
                    child: TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        hintText: 'Enter book description', // The hint text
                        hintStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: 400.0,
                  child: const Text(
                    "Publiser",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: 400.0,
                  child: Container(
                    color: Color(pubColor),
                    child: TextField(
                      controller: publisherController,
                      decoration: const InputDecoration(
                        hintText: 'Publisher', // The hint text
                        hintStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: 400.0,
                  child: const Text(
                    "Publised year",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: 400.0,
                  child: Container(
                    color: Color(pubYearColor),
                    child: TextField(
                      controller: yearController,
                      decoration: const InputDecoration(
                        hintText: 'Enter published year', // The hint text
                        hintStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                      textAlign: TextAlign.left,
                      keyboardType:
                          TextInputType.number, // Set keyboard type to number
                      inputFormatters: [
                        FilteringTextInputFormatter
                            .digitsOnly, // Allow only digits
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                child: Container(
                  width: 400.0,
                  child: const Text(
                    "Total page number",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: 400.0,
                  child: Container(
                    color: Color(pageColor),
                    child: TextField(
                      controller: pageNumberController,
                      decoration: const InputDecoration(
                        hintText: 'Enter total page number', // The hint text
                        hintStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter
                            .digitsOnly, // Allow only digits
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                width: 400.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        DateTime now = DateTime.now();
                        formattedDate = DateFormat('dd/MM/yyyy').format(now);

                        validate();
                        if (flag) {
                          _insertBook();
                        }

                        // final db = dbHelper.database;
                        // fetchData();
                      });
                    },
                    child: const Text(
                      "SUBMIT",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFb8f397)),
                      side: MaterialStateProperty.resolveWith((states) {
                        return const BorderSide(
                            color: Colors.black, width: 1.0);
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              16.0), // Optional: Add border radius
                        ),
                      ),
                    ),
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
