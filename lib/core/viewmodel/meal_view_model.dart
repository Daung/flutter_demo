import 'package:flutter/material.dart';
import 'package:study_flutter_003/core/model/meal.dart';
import 'package:study_flutter_003/core/service/meal_request.dart';

class WZMealViewModel extends ChangeNotifier {
  List<WZMealModel> _meals = [];
  //这是一个懒加载的过程，当需要的时候才会去初始化
  WZMealViewModel() {
    WZMealRequest.getMealData().then((value) {
      _meals = value;
      notifyListeners();
    });
  }

  List<WZMealModel> get meals => _meals;
}
