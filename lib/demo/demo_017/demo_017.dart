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

class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          //检测下来 Container嵌套Container点击手势
          //事件不会冒泡传递，既不会传递
          //既打印了 inner 又打印了outer
          GestureDetector(
            child: Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              color: Colors.purple,
              child: GestureDetector(
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.amber,
                ),
                onTap: () {
                  print("inner");
                },
              ),
            ),
            onTap: () {
              print("outer");
            },
          ),
          //假如说事件传递出现了冒泡，可以避免使用嵌套 即 container里面嵌套container
          //我们可以使用stack，让widget之间不要存在包含关系，让他们出现层级关系
          Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                ),
                onTap: () {
                  print("outer");
                },
              ),
              GestureDetector(
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
                onTap: () {
                  print("inner");
                },
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                ),
                onTap: () {
                  print("outer");
                },
              ),
              //如果我们点击顶层的widget，不想让他接收点击事件，想让事件传递到
              //下层的widget，可以给子widget加一个IgnorePointer widget
              //这样上层widget就可以忽略点击事件
              IgnorePointer(
                child: GestureDetector(
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    print("inner");
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
