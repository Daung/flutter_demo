import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  build(context) => MaterialApp(
    // home: MyHomePage(),
    initialRoute: MyHomePage.routeName,
    routes: {
      MyHomePage.routeName: (context) => MyHomePage(),
    },
    debugShowCheckedModeBanner: false,
  );
}

class MyHomePage extends StatelessWidget {
  static const routeName = "/";

  final GlobalKey<_MyHomeContentState> _globalKey = GlobalKey();

  build(context) => Scaffold(
    appBar: AppBar(
      title: Text("custom animation"),
    ),
    body: MyHomeContent(key: _globalKey),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        _globalKey.currentState.controller.forward();
      },
      child: Icon(Icons.add),
    ),
  );
}

class MyHomeContent extends StatefulWidget {
  final Key key;

  MyHomeContent({this.key}) : super(key: key);

  @override
  _MyHomeContentState createState() => _MyHomeContentState();
}

class _MyHomeContentState extends State<MyHomeContent>
    with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation _sizeAnimation;

  @override
  void initState() {
    super.initState();

    //动画控制器
    controller = AnimationController(vsync: this,duration: Duration(seconds: 2));

    //给曲线加上一个变化的值,比如说快进快出，或者匀速等

    CurvedAnimation _curvedAnimation =
    CurvedAnimation(parent: controller, curve: Curves.easeIn);

    //具体值的变化范围
    _sizeAnimation = Tween(begin: 50.0, end: 100.0).animate(_curvedAnimation);

    //每次值发生变化时，都会回调这个方法
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.favorite,
        color: Colors.red,
        size: _sizeAnimation.value,
      ),
    );
  }
}
