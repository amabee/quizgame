import 'package:flutter/material.dart';
import 'package:quizgame/models/bcq_model.dart';
import 'package:quizgame/services/bcq_services.dart';
import 'package:quizgame/views/home/bcq/bcq_item_view.dart';

class BcsViewModel extends ChangeNotifier {
  int _current = 0;
  List<BcqModel> _items = [];
  List<BcqItemView> _bcsItemList = [];
  List<Widget> _bcsSlider = [];

  List<Widget> get bcsSlider => _bcsSlider;

  set bcsSlider(List<Widget> value) {
    _bcsSlider = value;
    notifyListeners();
  }

  List<BcqItemView> get bcsItemList => _bcsItemList;

  set bcsItemList(List<BcqItemView> value) {
    _bcsItemList = value;
  }

  List<BcqModel> get items => _items;

  set items(List<BcqModel> value) {
    _items = value;
  }

  int get current => _current;

  set current(int value) {
    _current = value;
    notifyListeners();
  }

  BcsViewModel() {
    getBcs();
  }

  Future getBcs() async {
    items = await BcsServices().getBcs();
    bcsItemList = generateBcsItem();
    bcsSlider = generateBcsSliderList();
  }

  List<BcqItemView> generateBcsItem() {
    return List.generate(
        items.length,
        (index) => BcqItemView(
            title: items[index].title,
            questionNumber: items[index].questionNumber,
            duration: items[index].duration,
            price: items[index].price));
  }

  List<Widget> generateBcsSliderList() {
    return bcsItemList
        .map((item) => Stack(
              children: <Widget>[
                item,
              ],
            ))
        .toList();
  }
}
