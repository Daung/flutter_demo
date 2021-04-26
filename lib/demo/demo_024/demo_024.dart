import 'dart:math';

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
          title: Text("staggered animation"),
        ),
        body: MyHomeContent(key: _globalKey),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_globalKey.currentState.controller.isAnimating) {
              _globalKey.currentState.controller.stop();
            } else if (_globalKey.currentState.controller.status ==
                AnimationStatus.forward) {
              _globalKey.currentState.controller.forward();
            } else if (_globalKey.currentState.controller.status ==
                AnimationStatus.reverse) {
              _globalKey.currentState.controller.reverse();
            } else {
              _globalKey.currentState.controller.forward();
            }
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

  //大小动画
  Animation _sizeAnimation;

  //颜色动画
  Animation _colorAnimation;

  //透明度变化
  Animation _opacityAnimation;

  //旋转动画
  Animation _rotateAnimation;

  @override
  void initState() {
    super.initState();

    //动画控制器
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    //给曲线加上一个变化的值,比如说快进快出，或者匀速等

    CurvedAnimation _curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeIn);

    //具体值的变化范围
    _sizeAnimation = Tween(begin: 0.0, end: 100.0).animate(_curvedAnimation);

    _colorAnimation = ColorTween(begin: Colors.yellow, end: Colors.red)
        .animate(_curvedAnimation);
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(_curvedAnimation);
    _rotateAnimation = Tween(begin: 0.0, end: 2 * pi).animate(_curvedAnimation);

    //添加状态监听
    controller.addStatusListener((status) {
      //如果是结束的状态，就反转动画
      if (status == AnimationStatus.completed) {
        controller.reverse();
        //如果动画是开始的状态，就向前执行动画
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //实现交织动画

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Opacity(
        opacity: _opacityAnimation.value,
        child: Transform(
          transform: Matrix4.rotationZ(_rotateAnimation.value),
          child: Container(
            width: _sizeAnimation.value,
            height: _sizeAnimation.value,
            color: _colorAnimation.value,
          ),
        ),
      ),
    );
  }
}
