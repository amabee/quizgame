import 'package:quizgame/models/category_model.dart';

import 'db_repository.dart';

class CategoryRepository {
  Future createCategoryTable() async {
    final db = await DbRepository().database;
    String id = 'id INTEGER PRIMARY KEY AUTOINCREMENT';
    String name = 'name TEXT NOT NULL';
    String imageUri = 'imageUri TEXT NOT NULL';

    String sqlCategory =
        'CREATE TABLE IF NOT EXISTS category($id, $name, $imageUri)';
    db.execute(sqlCategory);
  }

  Future addCategory() async {
    final db = await DbRepository().database;
    final List<CategoryModel> categoryList = [
      CategoryModel(
          categoryName: "Bangladesh",
          imageUri: "lib/assets/logo/category/bangladesh.png"),
      CategoryModel(
          categoryName: "World",
          imageUri: "lib/assets/logo/category/world.png"),
      CategoryModel(
          categoryName: "Cricket",
          imageUri: "lib/assets/logo/category/cricket.jpg"),
      CategoryModel(
          categoryName: "Soccer",
          imageUri: "lib/assets/logo/category/soccer.jpg"),
      CategoryModel(
          categoryName: "Animal",
          imageUri: "lib/assets/logo/category/animal.png"),
    ];

    for (CategoryModel x in categoryList) {
      await db.insert('category', x.toMap());
    }
  }

  Future<List<Map<String, dynamic>>> loadCategory() async {
    final db = await DbRepository().database;
    final List<Map<String, dynamic>> maps = await db.query('category');

    if (maps.isNotEmpty) {
      return maps;
    } else {
      await addCategory();
      return await loadCategory();
    }
  }
}
