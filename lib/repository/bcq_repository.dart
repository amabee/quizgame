import 'package:quizgame/models/bcq_model.dart';

import 'db_repository.dart';

class BcqRepository {
  Future createBcqTable() async {
    final db = await DbRepository().database;
    String id = 'id INTEGER PRIMARY KEY AUTOINCREMENT';
    String title = 'title TEXT NOT NULL';
    String questionNumber = 'questionNumber TEXT NOT NULL';
    String duration = 'duration TEXT NOT NULL';
    String price = 'price TEXT NOT NULL';

    String sqlBcq =
        'CREATE TABLE IF NOT EXISTS BCQ($id, $title, $questionNumber, $duration, $price)';
    db.execute(sqlBcq);
  }

  Future addBcq(List<BcqModel> BcqList) async {
    final db = await DbRepository().database;

    for (BcqModel x in BcqList) {
      await db.insert('Bcq', x.toMap());
    }
  }

  Future<List<Map<String, dynamic>>> loadBcq() async {
    final db = await DbRepository().database;
    final List<Map<String, dynamic>> maps = await db.query('Bcq');

    final List<BcqModel> BcqList = [
      BcqModel(
          title: 'Bcq Model Test 1',
          questionNumber: '5',
          duration: '1',
          price: '10'),
      BcqModel(
          title: 'Bcq Model Test 2',
          questionNumber: '5',
          duration: '1',
          price: '10'),
      BcqModel(
          title: 'Bcq Model Test 3',
          questionNumber: '5',
          duration: '1',
          price: '10'),
      BcqModel(
          title: 'Bcq Model Test 4',
          questionNumber: '5',
          duration: '1',
          price: '10'),
    ];

    if (maps.isNotEmpty) {
      return maps;
    } else {
      await addBcq(BcqList);
      return await loadBcq();
    }
  }
}
