import 'package:my_deeze_music/model/favorite_model.dart';
import 'package:my_deeze_music/model/track.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

/// Classe per istanziare e gestire il database
class SavedFavorite {
  late Database database;

  Future<void> inizialize() async {
    final databasePath = await getDatabasesPath();

    final dbPath = path.join(databasePath, "deeze_music.db");
    database = await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute('''
CREATE TABLE favorite (
  id INTEGER PRIMARY KEY,
  id_deeze INTEGER,
  title TEXT NOT NULL,
  picture TEXT NOT NULL,
  artist TEXT NOT NULL,
  album TEXT NOT NULL
);
''');
    });
  }

  /// CRUD

  Future<void> create(Track track) async {
    await database.insert(
      'favorite',
      {
        'id_deeze': track.id,
        'title': track.title,
        'picture': track.picture,
        'artist': track.artist,
        'album': track.album,
      },
    );
  }

  Future<void> delete(Track track) async {
    await database.delete(
      'favorite',
      where: 'id_deeze = ?',
      whereArgs: [track.id],
    );
  }

  Future<List<FavoriteModel>> all() async {
    final List<Map<String, dynamic>> allFavorite =
        await database.query('favorite');

    return allFavorite
        .map((favorite) => FavoriteModel.fromRecord(favorite))
        .toList();
  }
}
