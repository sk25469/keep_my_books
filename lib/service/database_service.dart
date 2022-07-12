import 'package:library_sys/model/book.dart';
import 'package:library_sys/model/issued_book.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbManager {
  late Database _database;
  Future openDb() async {
    _database = await openDatabase(join(await getDatabasesPath(), "ss.db"), version: 1,
        onCreate: (Database db, _) async {
      await db.execute(
        "CREATE TABLE issuedBooks(id INTEGER PRIMARY KEY autoincrement, name TEXT, date TEXT, subject TEXT)",
      );
    });
    return _database;
  }

  Future insertIssuedBook(IssuedBook issuedBook) async {
    await openDb();
    return await _database.insert('issuedBooks', issuedBook.toMap());
  }

  Future<bool> hasAlreadyIssued(Book book) async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('issuedBooks');
    print(maps);

    for (var item in maps) {
      if (item['name'] == book.name && item['subject'] == book.subjectName) {
        return true;
      }
    }
    return false;
  }

  Future<List<IssuedBook>> getIssuedBook() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('issuedBooks');
    print(maps);

    return List.generate(
      maps.length,
      (i) {
        return IssuedBook(
          name: maps[i]['name'],
          subject: maps[i]['subject'],
          date: maps[i]['date'],
        );
      },
    );
  }
}
