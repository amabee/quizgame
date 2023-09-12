import 'package:quizgame/models/bcq_model.dart';

import 'db_repository.dart';

class BcsRepository {
  Future createBcsTable() async {
    final db = await DbRepository().database;
    String id = 'id INTEGER PRIMARY KEY AUTOINCREMENT';
    String title = 'title TEXT NOT NULL';
    String questionNumber = 'questionNumber TEXT NOT NULL';
    String duration = 'duration TEXT NOT NULL';
    String price = 'price TEXT NOT NULL';

    String sqlBcs =
        'CREATE TABLE IF NOT EXISTS BCS($id, $title, $questionNumber, $duration, $price)';
    db.execute(sqlBcs);
  }

  Future addBcs(List<BcqModel> bcsList) async {
    final db = await DbRepository().database;

    for (BcqModel x in bcsList) {
      await db.insert('BCS', x.toMap());
    }
  }

  Future<List<Map<String, dynamic>>> loadBcs() async {
    final db = await DbRepository().database;
    final List<Map<String, dynamic>> maps = await db.query('BCS');

    final List<BcqModel> bcsList = [
      BcqModel(
          title: 'BCS Model Test 1',
          questionNumber: '5',
          duration: '1',
          price: '10'),
      BcqModel(
          title: 'BCS Model Test 2',
          questionNumber: '5',
          duration: '1',
          price: '10'),
      BcqModel(
          title: 'BCS Model Test 3',
          questionNumber: '5',
          duration: '1',
          price: '10'),
      BcqModel(
          title: 'BCS Model Test 4',
          questionNumber: '5',
          duration: '1',
          price: '10'),
    ];

    if (maps.isNotEmpty) {
      return maps;
    } else {
      await addBcs(bcsList);
      return await loadBcs();
    }
  }
}
