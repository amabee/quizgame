class BcqModel {
  String title;
  String questionNumber;
  String duration;
  String price;

  BcqModel(
      {required this.title,
      required this.questionNumber,
      required this.duration,
      required this.price});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questionNumber': questionNumber,
      'duration': duration,
      'price': price,
    };
  }

  @override
  String toString() {
    return 'BcqModel{title: $title, questionNumber: $questionNumber, duration: $duration, price: $price}';
  }
}
