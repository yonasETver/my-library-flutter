// ignore_for_file: non_constant_identifier_names, file_names, depend_on_referenced_packages, duplicate_ignore

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDBHelper {
  // Singleton pattern
  static final MyDBHelper _instance = MyDBHelper._internal();
  factory MyDBHelper() => _instance;
  MyDBHelper._internal();

  late Database _database;

  Future<Database> get database async {
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'book_db.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS Books(
        book_id INTEGER PRIMARY KEY AUTOINCREMENT,
        book_title TEXT,
        book_author TEXT,
        book_description TEXT,
        book_publisher TEXT,
        book_publisher_year INTEGER,
        book_page_number INTEGER,
        image_path TEXT,
        start_date DATE
      );
      
      CREATE TABLE IF NOT EXISTS Aready_Read (
        c_id INTEGER PRIMARY KEY AUTOINCREMENT,
        book_id INTEGER,
        end_date DATE,
        FOREIGN KEY (book_id) REFERENCES Books(book_id)
      );

      CREATE TABLE IF NOT EXISTS Current_Reading (
        c_id INTEGER PRIMARY KEY AUTOINCREMENT,
        book_id INTEGER,
        start_date DATE,
        FOREIGN KEY (book_id) REFERENCES Books(book_id)
      );

      CREATE TABLE IF NOT EXISTS Wish_list (
        c_id INTEGER PRIMARY KEY AUTOINCREMENT,
        book_id INTEGER,
        tart_date DATE,
        FOREIGN KEY (book_id) REFERENCES Books(book_id)
      );

      CREATE TABLE IF NOT EXISTS Fav_book (
        c_id INTEGER PRIMARY KEY AUTOINCREMENT,
        book_id INTEGER,
        FOREIGN KEY (book_id) REFERENCES Books(book_id)
      );
    ''');
  }

  Future<void> insertData(
      String book_title,
      String book_author,
      String book_description,
      String book_publisher,
      int book_publisher_year,
      int book_page_number,
      String image_path,
      String start_date) async {
    final Database db = await database;
    await db.insert(
      'Books',
      {
        'book_title': book_title,
        'book_author': book_author,
        'book_description': book_description,
        'book_publisher': book_publisher,
        'book_publisher_year': book_publisher_year,
        'book_page_number': book_page_number,
        'image_path': image_path,
        'start_date': start_date
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertDataAready(int book_id, String end_date) async {
    final Database db = await database;
    await db.insert(
      'Aready_Read',
      {
        'book_id': book_id,
        'end_date': end_date,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> insertDataCurrent(int book_id, String start_date) async {
    final Database db = await database;
    await db.insert(
      'Current_Reading',
      {
        'book_id': book_id,
        'start_date': start_date,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertDataWish(int book_id, String start_date) async {
    final Database db = await database;
    await db.insert(
      'Wish_list',
      {
        'book_id': book_id,
        'start_date': start_date,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getAllData() async {
    final Database db = await database;
    return await db.query('Books'); // Use table name instead of full SQL query
  }

  Future<List<Map<String, dynamic>>> getAreadyData() async {
    final Database db = await database;
    return await db.rawQuery('''
    SELECT Books.*, Aready_Read.*
    FROM Books
    JOIN Aready_Read ON Books.book_id = Aready_Read.book_id
  ''');
  }

  Future<List<Map<String, dynamic>>> getAreadyOnly() async {
    final Database db = await database;
    return await db.rawQuery('SELECT * FROM Aready_Read');
  }

  Future<List<Map<String, dynamic>>> getFavData() async {
    final Database db = await database;
    return await db.rawQuery('''
    SELECT Books.*, Fav_book.*
    FROM Books
    JOIN Fav_book ON Books.book_id = Fav_book.book_id
  ''');
  }

  Future<List<Map<String, dynamic>>> getFavOnly() async {
    final Database db = await database;
    return await db.rawQuery('SELECT * FROM Fav_book');
  }

  Future<List<Map<String, dynamic>>> getCurrentData() async {
    final Database db = await database;
    return await db.rawQuery('''
    SELECT Books.*, Current_Reading.* 
    FROM Books
    JOIN Current_Reading ON Books.book_id = Current_Reading.book_id
  ''');
  }

  Future<List<Map<String, dynamic>>> getCurrentDataOnly() async {
    final Database db = await database;
    return await db.rawQuery('SELECT * FROM Current_Reading');
  }

  Future<List<Map<String, dynamic>>> getWishData() async {
    final Database db = await database;
    return await db.rawQuery('''
    SELECT Books.*, Wish_list.*
    FROM Books
    JOIN Wish_list ON Books.book_id = Wish_list.book_id
  ''');
  }

  Future<List<Map<String, dynamic>>> getWishOnly() async {
    final Database db = await database;
    return await db.rawQuery('SELECT * FROM Wish_list');
  }
}
