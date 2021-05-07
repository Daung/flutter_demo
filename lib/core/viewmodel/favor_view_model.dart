import 'package:flutter/material.dart';
import 'package:study_flutter_003/core/model/meal.dart';

class WZFavoriteMealViewModel extends ChangeNotifier {
  final List<WZMealModel> _meals = [];

  List<WZMealModel> get meals => _meals;

  void addMeal(WZMealModel model) {
    _meals.add(model);
    notifyListeners();
  }

  void removeMeal(WZMealModel model) {
    _meals.remove(model);
    notifyListeners();
  }

  bool isContain(WZMealModel model) {
    return _meals.contains(model);
  }
}
