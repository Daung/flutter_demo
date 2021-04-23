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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 100;

  void addCounter() {
    setState(() {
      ++counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WZCounterWidget(
      counter: counter,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Inherited widget"),
        ),
        body: MyBodyContent(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: addCounter,
        ),
      ),
    );
  }
}

class WZCounterWidget extends InheritedWidget {
  //需要共享的数据
  //要想更新counter的值，因为是继承Widget的，所以变量都是final
  //我们的思路应该是 怎样创建widget 来就改counter的值
  //而不是找到当前的widget，来修改当前变量的值
  final int counter;

  //构造方法,需要传递过来一个widget，然后传递给父类
  const WZCounterWidget({this.counter: 100, Widget child})
      : super(child: child);

  //定义一个返回当前实力的静态方法
  static WZCounterWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<WZCounterWidget>();
  }

  //这个方法主要回调 的StatefulWidget生命周期里面的一个方法
  //如果返回true 会回调 State对象生命周期里面的的 didChangeDependencies方法
  //如果返回false 不会回调 State对象 生命周期里面的 didChangeDependencies方法
  @override
  bool updateShouldNotify(WZCounterWidget oldWidget) {
    return oldWidget.counter != counter;
  }
}

class MyBodyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyItemWidget1(),
          MyItemWidget2(),
          MyItemWidget3(),
          MyItemWidget4()
        ],
      ),
    );
  }
}

class MyItemWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int counter = WZCounterWidget.of(context).counter;
    return Text("widget1 counter is $counter");
  }
}

class MyItemWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int counter = WZCounterWidget.of(context).counter;
    return Text("widget2 counter is $counter");
  }
}

class MyItemWidget3 extends StatefulWidget {
  @override
  _MyItemWidget3State createState() => _MyItemWidget3State();
}

class _MyItemWidget3State extends State<MyItemWidget3> {
  @override
  Widget build(BuildContext context) {
    int counter = WZCounterWidget.of(context).counter;
    return Text("widget3 counter is $counter");
  }
}

class MyItemWidget4 extends StatefulWidget {
  @override
  _MyItemWidget4State createState() => _MyItemWidget4State();
}

class _MyItemWidget4State extends State<MyItemWidget4> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print("MyItemWidget4 didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    int counter = WZCounterWidget.of(context).counter;
    return Text("widget4 counter is $counter");
  }
}
