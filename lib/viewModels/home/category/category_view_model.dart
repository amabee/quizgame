import 'package:flutter/material.dart';
import 'package:quizgame/models/category_model.dart';
import 'package:quizgame/services/category_services.dart';
import 'package:quizgame/views/home/category/category_item_view.dart';

class CategoryViewModel extends ChangeNotifier {
  List<CategoryModel> _items = [];
  List<CategoryItemView> _categoryItem = [];

  List<CategoryItemView> get categoryItem => _categoryItem;

  set categoryItem(List<CategoryItemView> value) {
    _categoryItem = value;
    notifyListeners();
  }

  CategoryViewModel() {
    getCategory();
  }

  Future getCategory() async {
    _items = await CategoryServices().getCategory();
    categoryItem = generatingCategoryItemList();
  }

  List<CategoryItemView> generatingCategoryItemList() {
    return List.generate(
        _items.length,
        (index) => CategoryItemView(
              name: _items[index].categoryName,
              imageUri: _items[index].imageUri,
              categoryId: _items[index].id,
            ));
  }
}
