import 'package:flutter_notes_bloc_sqlite/Databasehelper/tables.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Databasehelper {
  final databaseName = 'note.db';

  Future<Database> initDatabase() async {
    final databasePath = await getApplicationDocumentsDirectory();
    final path = join(databasePath.path, databaseName);
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(Tables.noteTable);
    });
  }
}