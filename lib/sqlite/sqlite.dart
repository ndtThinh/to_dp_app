import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_dp_app/sqlite/note_model.dart';

class DatabaseHelper {
  final databseName = 'databaseNote.db';
  final nameTable = 'notes';

  Future<Database> initDB() async {
    String noteTable =
        'CREATE TABLE notes (noteId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, noteTitle TEXT NOT NULL, noteContent TEXT NOT NULL, createAt TEXT DEFAULT CURRENT_TIMESTAMP)';

    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(noteTable);
    });
  }

  //CREATE NOTE
  Future<int> createNote(NoteModel note) async {
    final Database db = await initDB();

    return db.insert(nameTable, note.toMap());
  }

  //GET ALL NOTE
  Future<List<NoteModel>> getAllNote() async {
    final Database db = await initDB();
    List<Map<String, Object?>> results = await db.query(nameTable);

    return results.map((e) => NoteModel.fromMap(e)).toList();
  }

  //DELETE NOTE
  Future<int> deleteNote(int id) async {
    final Database db = await initDB();
    return db.delete(nameTable, where: 'noteId=?', whereArgs: [id]);
  }

  //UPDATE NOTE
  Future<int> updateNote(int id, String title, String content) async {
    final Database db = await initDB();
    return db.rawUpdate(
        'UPDATE $nameTable SET noteTitle= ?, noteContent=? where noteId=?',
        [title, content, id]);
  }
}
