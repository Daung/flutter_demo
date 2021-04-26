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
  Animation _sizeAnimation;

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
    _sizeAnimation = Tween(begin: 50.0, end: 100.0).animate(_curvedAnimation);

    //每次值发生变化时，都会回调这个方法
    // controller.addListener(() {
    //   setState(() {});
    // });
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
    return Center(
      //目前执行动画有个缺点，一个是调用setState方法，那么整个页面都会构建，
      // child: Icon(Icons.favorite, color: Colors.red, size: _sizeAnimation.value,),
      //第二种方法 继承自 AnimatedWidget，使用这种方法之后，就不需要调用setState
      //注释掉方法    // controller.addListener(() {
      //     //   setState(() {});
      //     // });

      //第二种方法有一个弊端，就是要创建动画时，每次都要创建一个类
      // child: WZAnimatedWidget(_sizeAnimation),
      //使用第三种方法 AnimatedBuilder,两个比穿参数 animation 传递controller ，builder，返回要做动画的widget
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Icon(
          Icons.favorite,
          color: Colors.red,
          size: _sizeAnimation.value,
        ),
      ),
    );
  }
}

class WZAnimatedWidget extends AnimatedWidget {
  //需要传递过来一个animation对象，然后调用父类的构造方法
  WZAnimatedWidget(Animation animation) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;
    //返回要执行动画的widget
    return Icon(
      Icons.favorite,
      color: Colors.red,
      size: animation.value,
    );
  }
}
