import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter_003/extension/int_fit.dart';
import 'package:study_flutter_003/size/size.dart';
import 'package:study_flutter_003/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //初始化设备信息
    WZDeviceInfo.iniDeviceInfo();
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
    return Scaffold(
      appBar: AppBar(
        title: Text("add int extension"),
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
      child: Container(
        //使用起来就非常的方便 直接int类型.px
        width: 200.px,
        height: 200.px,
        color: Colors.red,
      ),
    );
  }
}
