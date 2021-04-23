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
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollStartNotification) {
          print("开始滚动。。。。");
        } else if (notification is ScrollUpdateNotification) {
          print("持续滚动。。。");
          print("最大滚动的范围 ：${notification.metrics.maxScrollExtent}， 目前滚动的范围 ${notification.metrics.pixels}");
        } else if (notification is ScrollEndNotification) {
          print("结束滚动。。。。");
        }
        return true;
      },
      child: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text("address number $index"),
          leading: Icon(Icons.people),
        ),
        itemCount: 100,
      ),
    );
  }
}

class MyHomeBody extends StatefulWidget {
  @override
  _MyHomeBodyState createState() => _MyHomeBodyState();
}

class _MyHomeBodyState extends State<MyHomeBody> {
  //initialScrollOffset   初始化滚动的位置
  //controll只能监听滚动的偏移量， 不能监听 开始滑动，结束滑动
  final ScrollController _controller =
  ScrollController(initialScrollOffset: 200);

  @override
  void initState() {
    //添加监听
    _controller.addListener(() {
      print("offset = ${_controller.offset}");
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.pets),
          title: Text("test number $index"),
          onLongPress: () {
            if (_controller.offset > 1000) {
              //回到指定的位置
              _controller.animateTo(0,
                  duration: Duration(seconds: 2), curve: Curves.easeIn);
            }

            print("onLongPress");
          },
        );
      },
      itemCount: 100,
    );
  }
}
