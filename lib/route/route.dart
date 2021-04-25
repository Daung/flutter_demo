import 'package:flutter/material.dart';
import 'package:study_flutter_003/demo/demo_021/demo_021.dart';


//在开发中，我们一般对route 做简单的封装，
//会把初始化路由 作为一个参数
//还有就是 路由页面
//还有命名路由传值
//还有错误页面
//放在一个单独的类中
//然后在主工程中引入使用
class WZRoute {

  static final initialRoute = MyHomePage.routeName;


  static final Map<String, WidgetBuilder> routes = {
    MyHomePage.routeName: (context) => MyHomePage(),
    WZAboutPage.routeName: (context) => WZAboutPage(),
  };

  static final RouteFactory onGenerateRoute = (settings) {
    if (settings.name == WZSettingPage.routeName) {
      return MaterialPageRoute(
          builder: (context) => WZSettingPage(settings.arguments));
    }
    return null;
  };

  static final RouteFactory onUnknownRoute = (settings) {
    return MaterialPageRoute(builder: (context) => WZUnknownPage());
  };
}
