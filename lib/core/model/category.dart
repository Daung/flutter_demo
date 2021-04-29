import 'package:flutter/material.dart';

/// id : "c3"
/// title : "汉堡包"
/// color : "FF9800"

class WZCategory {
  String _id;
  String _title;
  String _color;
  Color _cColor;

  String get id => _id;

  String get title => _title;

  String get color => _color;

  Color get cColor => _cColor;

  WZCategory({String id, String title, String color}) {
    _id = id;
    _title = title;
    _color = color;
  }

  WZCategory.fromJson(dynamic json) {
    _id = json["id"];
    _title = json["title"];
    _color = json["color"];
    //将字符串转化成16进制的整形
    int oxColor = int.parse(_color, radix: 16);
    //然后整形和0xff000000进行逻辑或，得到16进制的color
    _cColor = Color(oxColor | 0xff000000);
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["title"] = _title;
    map["color"] = _color;
    return map;
  }
}
