import 'package:flutter/material.dart';
import 'package:study_flutter_003/core/model/meal.dart';
import 'package:study_flutter_003/core/service/meal_request.dart';
import 'package:study_flutter_003/core/viewmodel/filter_view_model.dart';

class WZMealViewModel extends ChangeNotifier {
  List<WZMealModel> _meals = [];

  WZFilterViewModel _filterVM;

  //这是一个懒加载的过程，当需要的时候才会去初始化
  WZMealViewModel() {
    WZMealRequest.getMealData().then((value) {
      _meals = value;
      notifyListeners();
    });
  }

  List<WZMealModel> get meals {
    return _meals.where((meal) {
      if (_filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian) return false;
      if (_filterVM.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  void update(WZFilterViewModel filterVM) {
    this._filterVM = filterVM;
  }
}
