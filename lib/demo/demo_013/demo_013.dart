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
    body: MyHomeBody(),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    ),
  );
}

void getData() {
  print("start print");
  sleep(Duration(seconds: 2));
  print("end print");
}

void getDataByFuture() {
  print("start print");
  var future = Future(() {
    sleep(Duration(seconds: 2));
    return "hello flutter";
  }).then((value) => print(value));
  print(future);
  print("end print");
}

//耗时的操作前面，加上await
//await要用在在async 函数声明
//使用await必须要返回一个future
//语法糖 ，如果我们返回 Future<String> 我们直接返回string，框架自动帮我们封装 成Future<String>
//再比如 如果我们返回  Future<int> 我们可以直接返回 int
//如果不返回内容  ，那么返回的类型为  Future<void>

//如果返回的结果是future<String> 类型，行直接拿到里面的string类型，可以在前面加上  await直接使用 string
// String result = await Future.value("aaa");

Future<String> getDataByAsyncAwait() async {
  print("start print");

  await sleep(Duration(seconds: 2));

  print("end print");

  return Future.value("hello async await getDataByAsyncAwait");
  // return "hello async await";
}

Future<String> getDataByAsyncAwait1() async {
  print("start print");

  await sleep(Duration(seconds: 2));

  print("end print");
  return "hello async await getDataByAsyncAwait1";
}

//模拟网络请求 ，调用 3次，打印每次的打印结果

Future<void> getDataByContinueFuture() async {
  mockNetWork("args")
      .then((value) => mockNetWork(value))
      .then((value) => mockNetWork(value));
}

Future<String> mockNetWork(String args) {
  return Future(() {
    sleep(Duration(seconds: 2));
    print("net work " + args);
    return "net work " + args;
  });
}

//Future 转化成 async await

void getDataFutureConvertAsyncAwait() async {
  var value = await mockNetWork("args");
  value = await mockNetWork(value);
  await mockNetWork(value);
}

class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            onPressed: () {
              getData();
            },
            child: Text("getData")),
        ElevatedButton(
            onPressed: () {
              getDataByFuture();
            },
            child: Text("getDataByFuture")),
        ElevatedButton(
            onPressed: () {
              var future = getDataByAsyncAwait();
              future.then((value) => print(value));
            },
            child: Text("getDataByAsyncAwait")),
        ElevatedButton(
            onPressed: () {
              var future = getDataByAsyncAwait1();
              future.then((value) => print(value));
            },
            child: Text("getDataByAsyncAwait1")),
        ElevatedButton(
            onPressed: () {
              getDataByContinueFuture();
            },
            child: Text("getDataByAsyncAwait1")),
        ElevatedButton(
            onPressed: () {
              getDataFutureConvertAsyncAwait();
            },
            child: Text("getDataFutureConvertAsyncAwait")),
      ],
    );
  }
}
