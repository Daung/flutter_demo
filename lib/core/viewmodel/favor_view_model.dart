import 'package:flutter/material.dart';
import 'package:study_flutter_003/core/model/meal.dart';
import 'package:study_flutter_003/core/viewmodel/filter_view_model.dart';

class WZFavoriteMealViewModel extends ChangeNotifier {
  final List<WZMealModel> _meals = [];

  WZFilterViewModel _filterVM;

  List<WZMealModel> get meals {
    return _meals.where((meal) {
      if (_filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian) return false;
      if (_filterVM.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

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

  void update(WZFilterViewModel filterVM) {
    this._filterVM = filterVM;
  }
}
