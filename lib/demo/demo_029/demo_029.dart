import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter_003/size/size.dart';
import 'package:study_flutter_003/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WZDeviceInfo.iniDeviceInfo();
    //拿到手机的逻辑分辨率
    // double phyW = window.physicalSize.width;
    // double phyH = window.physicalSize.height;
    // print("逻辑分辨率： $phyW * $phyH");
    //
    // double dpr = window.devicePixelRatio;
    // double width = phyW / dpr;
    //
    // double height = phyH / dpr;
    //
    //
    // print("屏幕的宽高  $width * $height");
    //
    //
    //
    // double statusBarHeight = window.padding.top / dpr;
    //
    // print("状态栏的高度 ：$statusBarHeight");

    return MaterialApp(
      // home: MyHomePage(),
      initialRoute: MyHomePage.routeName,
      routes: {
        MyHomePage.routeName: (context) => MyHomePage(),
      },
      theme: WZAppTheme.themeData,
      darkTheme: WZAppTheme.darkThemeData,

      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    // //拿到手机的逻辑分辨率
    // double phyW = window.physicalSize.width;
    // double phyH = window.physicalSize.height;
    // print("逻辑分辨率： $phyW * $phyH");
    //
    // //物理分辨率，手机的真实大小
    // double logicW = MediaQuery.of(context).size.width;
    // double logicH = MediaQuery.of(context).size.height;
    //
    // //物理设备的宽高 * 设备像素比 = 逻辑分辨率
    // double dpr = MediaQuery.of(context).devicePixelRatio;
    //
    // print("物理分辨率：$logicW * $logicH devicePixelRatio = $dpr");
    //
    // double statusBarHeight = MediaQuery.of(context).padding.top;

    // print("状态栏的高度 ：$statusBarHeight");
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme page"),
      ),
      body: MyHomeContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyHomeContent extends StatefulWidget {
  @override
  _MyHomeContentState createState() => _MyHomeContentState();
}

class _MyHomeContentState extends State<MyHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("center"),
    );
  }
}
