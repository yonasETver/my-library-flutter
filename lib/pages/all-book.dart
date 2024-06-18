import 'package:flutter/material.dart';
import 'package:my_lbrary/dbHelper.dart';
import 'package:my_lbrary/top_bar.dart';
import 'package:my_lbrary/subPages/all_book_card.dart';
import 'package:my_lbrary/main.dart';

class AllBook extends StatefulWidget {
  const AllBook({Key? key}) : super(key: key);

  @override
  State<AllBook> createState() => _AllBookState();
}

class _AllBookState extends State<AllBook> {
  final dbHelper = MyDBHelper();
  List<Map<String, dynamic>> books = [];
  bool isLoading = true;

  Future<void> fetchData() async {
    var data = await dbHelper.getAllData();
    setState(() {
      books = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: Column(
        children: [
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
                      'All BOOKS',
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
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverToBoxAdapter(
                          child: Container(
                            // Add any control widgets here
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                // Add control widgets as needed
                              ],
                            ),
                          ),
                        ),
                        SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0,
                            childAspectRatio:
                                2 / 3, // Adjust this ratio as needed
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              final book = books[index];
                              final imageUrl =
                                  book['image_path'] ?? 'assets/coverPhoto.png';
                              final title = book['book_title'] ?? "null";
                              final author = book['book_author'] ?? "null";
                              final publisher =
                                  book['book_publisher'] ?? "null";
                              final publishedYear =
                                  book['book_publisher_year'] ?? 00;
                              final page = book['book_page_number'] ?? 00;
                              final id = book['book_id'] ?? 00;

                              return AllBookCard(
                                  imgUrl: imageUrl,
                                  title: title,
                                  author: author,
                                  publisher: publisher,
                                  publishedYear: publishedYear.toString(),
                                  page: page.toString(),
                                  id: id.toString());
                            },
                            childCount: books.length,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
