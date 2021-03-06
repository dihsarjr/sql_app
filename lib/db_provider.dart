import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sql_app/model/user_model.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'youtube.DB'),
        onCreate: (db, version) async {
      await db.execute('''
       CREATE TABLE users(
         username TEXT PRIMARY KEY, password TEXT
       )
      
       ''');
    }, version: 1);
  }

  newUser(User newUser) async {
    final db = await database;
    var res = await db.rawInsert('''

    INSERT INTO users (
      username, password
    ) VALUES (?, ?)
    
     ''', [newUser.userName, newUser.password]);
    return res;
  }

  Future<dynamic> getUser() async {
    final db = await database;
    var res = await db.query('''users''');
    if (res.length == 0) {
      return null;
    } else {
      var resMap = res[0];
      return res.isNotEmpty ? resMap : null;
    }
  }
}
