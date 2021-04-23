import 'dart:isolate';

import 'package:flutter/foundation.dart';
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
      title: Text("isolate"),
    ),
    body: MyHomeBody(),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    ),
  );
}

//自定义线程
void calculate(int count) {
  int sum = 0;
  for (int i = 0; i < count; i++) {
    sum += i;
  }
  print(Isolate.current.debugName);
  print(sum);
}

int calculate1(int count) {
  int sum = 0;
  for (int i = 0; i < count; i++) {
    sum += i;
  }
  print(Isolate.current.debugName);
  print(sum);
  return sum;
}

void runCalculate(int count) async {
  //开启线程执行 ，和 Isolate区别就是（目前来说computer可以直接拿到返回值）
  int sum = await compute(calculate1, count);
  print("再次打印 sum = $sum");
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
              print(Isolate.current.debugName);
              Isolate.spawn(calculate, 100);
            },
            child: Text("Isolate")),
        ElevatedButton(onPressed: () {
          runCalculate(100);
        }, child: Text("Isolate compute")),
      ],
    );
  }
}
