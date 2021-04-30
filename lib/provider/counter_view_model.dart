import 'package:flutter/material.dart';

class WZCounterViewModel extends ChangeNotifier {
  int _counter = 100;

  int get counter => _counter;

  set counter(int counter) {
    this._counter = counter;
    notifyListeners();
  }
}
