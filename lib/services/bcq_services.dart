import 'package:quizgame/models/bcq_model.dart';
import 'package:quizgame/repository/bcq_repository.dart';

class BcsServices {
  Future<List<BcqModel>> getBcs() async {
    BcqRepository bcsRepository = BcqRepository();
    await bcsRepository.createBcqTable();
    List<Map<String, dynamic>> maps = await bcsRepository.loadBcq();
    if (maps.isNotEmpty) {
      final bcsList = List.generate(maps.length, (i) {
        return BcqModel(
            title: maps[i]['title'],
            questionNumber: maps[i]['questionNumber'],
            duration: maps[i]['duration'],
            price: maps[i]['price']);
      });
      return bcsList;
    }
    return [];
  }
}
