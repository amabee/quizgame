class CategoryModel {
  int id;
  String categoryName;
  String imageUri;

  CategoryModel(
      {this.id = 0, required this.categoryName, required this.imageUri});

  Map<String, dynamic> toMap() {
    return {
      'categoryName': categoryName,
      'imageUri': imageUri,
    };
  }

  @override
  String toString() {
    return 'CategoryModel{categoryName: $categoryName, imageUri: $imageUri}';
  }
}
