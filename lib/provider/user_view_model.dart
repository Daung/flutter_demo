import 'package:flutter/material.dart';

import '../provider/user_model.dart';

class WZUserInfoViewModel extends ChangeNotifier {
  WZUserInfoModel _user;

  WZUserInfoViewModel(this._user);

  WZUserInfoModel get user => _user;

  set setUser(WZUserInfoModel model) {
    this._user = model;
    notifyListeners();
  }
}
