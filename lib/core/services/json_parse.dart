import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:study_flutter_003/core/model/category.dart';

class JsonParse {
  static Future<List<WZCategory>> getCategoryData() async {
    //加载json文件
    final data = await rootBundle.loadString("assets/json/category.json");

    print(data);

    //将json string 转化成 map/list
    final result = json.decode(data);

    final resultList = result["category"];
    List<WZCategory> categories = [];

    for (dynamic item in resultList) {
      WZCategory category = WZCategory.fromJson(item);
      categories.add(category);
    }

    return categories.toList();
  }
}
