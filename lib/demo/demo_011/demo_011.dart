import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  build(context) => MaterialApp(
    home: MyHomePage(),
    debugShowCheckedModeBanner: false,
  );
}

class MyHomePage extends StatelessWidget {
  build(context) => Scaffold(
    appBar: AppBar(
      title: Text("sliver demo"),
    ),
    body: MyHomeBody1(),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    ),
  );
}

class MyHomeBody1 extends StatelessWidget {
  //future 测试使用，我们把好事的操作包裹在Future里面
  Future<String> getNetworkData() {
    return Future(() {
      sleep(Duration(seconds: 3));
      return "Hello Flutter";
      // throw Exception("我是错误消息");
    });
  }

  //future 的链式调用

  void getReTryNetWork() {
    Future(() {
      sleep(Duration(seconds: 2));
      return "第一次调用返回";
    })
        .then((value) {
      print(value);
      sleep(Duration(seconds: 2));
      return "第二次次调用返回";
    })
        .then((value) {
      print(value);
      sleep(Duration(seconds: 2));
      return "第三次调用返回";
    })
        .then((value) => print(value))
        .whenComplete(() => print("调用完成"))
        .onError((error, stackTrace) {
      print(error);

    });
  }


  //future 的其他API，简单实用




  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              print("start print");

              getReTryNetWork();

              print("end print");
            },
            child: Text("future"),
          ),
          ElevatedButton(
            onPressed: () {
              print("start print");

              var networkData = getNetworkData();
              networkData
                  .then((String value) => print(value))
                  .onError((error, stackTrace) {
                print(error);
                print(stackTrace);
              }).whenComplete(() => print("代码执行完成"));

              print("end print");
            },
            child: Text("future"),
          ),


          ElevatedButton(
            onPressed: () {
              Future.value("hahahha").then((value) => print(value));
            },
            child: Text("future1"),
          ),


          ElevatedButton(
            onPressed: () {
              Future.error("我是错误信息").then((value) => print(value));
            },
            child: Text("future2"),
          ),

          ElevatedButton(
            onPressed: () {
              Future.delayed(Duration(seconds: 3),() {
                return "我是第一次返回";
              }).then((value) => print(value));
            },
            child: Text("future3"),
          ),
        ],
      ),
    );
  }
}
