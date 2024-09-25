class Tables {
  static String noteTableName = "notes";
  static String noteTable = '''
CREATE TABLE IF NOT EXİSTS $noteTableName(
noteId INTEGER PRIMARY KEY AUTOINCREMENT,
title TEXT,
content TEXT,
createdAT Text
  ) ''';
}