import 'package:flutter_notes_bloc_sqlite/Databasehelper/connection.dart';
import 'package:flutter_notes_bloc_sqlite/Databasehelper/tables.dart';
import 'package:flutter_notes_bloc_sqlite/Models/note_model.dart';

class Repository {
  final Databasehelper databasehelper = Databasehelper();

  Future<List<Notes>> getNotes() async {
    final db = await databasehelper.initDatabase();
    final List<Map<String,Object?>> notes = await db.query(Tables.noteTableName);
    return notes.map((e) => Notes.fromMap(e)).toList();
  }

  Future<int> addNote(Notes notes) async {
    final db = await databasehelper.initDatabase();
    return db.insert(Tables.noteTableName, notes.toMap());
  }

  Future<int> updateNote(Notes notes) async {
    final db = await databasehelper.initDatabase();
    return db.update(Tables.noteTableName, notes.toMap(), where: "noteId = ?", whereArgs: [notes.noteId]);
  }

  Future<int> deleteNot(int id) async {
    final db = await databasehelper.initDatabase();
    return db.delete(Tables.noteTableName, where: "noteId = ?", whereArgs: [id]);
  }

  Future<Notes> getNoyById(int id) async {
    final db = await databasehelper.initDatabase();
    final notes = await db.query(Tables.noteTableName, where: "noteId = ?", whereArgs: [id]);
    if(notes.isNotEmpty) {
      return Notes.fromMap(notes.first);
    } else {
      throw Exception("Note $id not found");
    }
  }
}