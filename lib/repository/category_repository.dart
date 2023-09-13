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
          categoryName: "Criminal Law and Jurisprudence",
          imageUri: "lib/assets/category/clj.jpg"),
      CategoryModel(
          categoryName: "Law Enforcement Administration",
          imageUri: "lib/assets/category/lea.png"),
      CategoryModel(
          categoryName: "Forensics/Criminalistics",
          imageUri: "lib/assets/category/forensic.png"),
      CategoryModel(
          categoryName: "Crime Detection and Investigation",
          imageUri: "lib/assets/category/cdi.jpg"),
      CategoryModel(
          categoryName: "Sociology of Crimes and Ethics",
          imageUri: "lib/assets/category/lea.png"),
      CategoryModel(
          categoryName: "Correctional Administration",
          imageUri: "lib/assets/category/correctional.png"),
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
