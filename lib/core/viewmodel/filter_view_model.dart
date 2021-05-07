import 'package:flutter/cupertino.dart';

class WZFilterViewModel extends ChangeNotifier {
  //五谷蛋白
  bool _isGlutenFree = false;

  //有无乳糖
  bool _isLactoseFree = false;

  //素食主义
  bool _isVegetarian = false;

  //严格素食主义
  bool _isVegan = false;

  bool get isGlutenFree => _isGlutenFree;

  bool get isLactoseFree => _isLactoseFree;

  bool get isVegetarian => _isVegetarian;

  bool get isVegan => _isVegan;

  set isVegan(bool value) {
    _isVegan = value;
    notifyListeners();
  }

  set isVegetarian(bool value) {
    _isVegetarian = value;
    notifyListeners();
  }

  set isLactoseFree(bool value) {
    _isLactoseFree = value;
    notifyListeners();
  }

  set isGlutenFree(bool value) {
    _isGlutenFree = value;
    notifyListeners();
  }
}
