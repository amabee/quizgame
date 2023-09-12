import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbRepository {
  static final DbRepository _dbRepository = DbRepository._();
  static Database? _database;

  DbRepository._();

  factory DbRepository() {
    return _dbRepository;
  }

  // GET THE DATABASE
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('quiz_app.db');
    return _database!;
  }

  // CREATE THE DATABASE
  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);

    try {
      return await openDatabase(path, version: 1, onCreate: _onCreateDB);
    } catch (e) {
      // print('Error opening database : $e');
      throw Exception('Error opening database: $e');
    }
  }

  Future _onCreateDB(Database db, int version) async {
    // CREATE UERS TABLE
    String id = 'id INTEGER PRIMARY KEY AUTOINCREMENT';
    String name = 'name TEXT NOT NULL';
    String email = 'email TEXT NOT NULL';
    String password = 'password TEXT NOT NULL';
    String loginStatus = 'loginStatus BOOLEAN NOT NULL';
    String exp = 'exp INTEGER NOT NULL';
    String lvl = 'lvl INTEGER NOT NULL';
    String coin = 'coin INTEGER NOT NULL';
    String gems = 'gems INTEGER NOT NULL';
    String sqlUser =
        'CREATE TABLE users($id, $name, $email, $password, $loginStatus, $exp, $lvl, $coin, $gems)';

    try {
      await db.execute(sqlUser);
    } catch (e) {
      throw Exception('Error creating table: $e');
    }
  }
}
