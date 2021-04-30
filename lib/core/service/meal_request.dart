import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:study_flutter_003/core/model/meal.dart';
import 'package:study_flutter_003/service/http_request.dart';

class WZMealRequest {
  // static Future<List<WZMealModel>> getMealData() async {
  //   final url = "/meal";
  //   final result = await HttpRequest.request(url);
  //
  //   print(result);
  //
  //   final _meals = json.decode(result);
  //
  //   final mealList = _meals['meal'];
  //   List<WZMealModel> meals = [];
  //   for (dynamic json in mealList) {
  //     meals.add(WZMealModel.fromJson(json));
  //   }
  //   return meals.toList();
  // }

  static Future<List<WZMealModel>> getMealData() async {
    final url = "/meal";
    final result = await rootBundle.loadString("assets/json/meal.json");

    print(result);

    final _meals = json.decode(result);

    final mealList = _meals['meal'];
    List<WZMealModel> meals = [];
    for (dynamic json in mealList) {
      meals.add(WZMealModel.fromJson(json));
    }
    return meals.toList();
  }
}
