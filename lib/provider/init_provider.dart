import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../provider/counter_view_model.dart';
import '../provider/user_model.dart';
import '../provider/user_view_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => WZCounterViewModel()),
  ChangeNotifierProvider(
      create: (context) =>
          WZUserInfoViewModel(WZUserInfoModel(name: "wzy", age: 6))),
];
