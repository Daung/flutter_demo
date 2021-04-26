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

  build(context) => Scaffold(
    appBar: AppBar(
      title: Text("navigation animation"),
    ),
    body: MyHomeContent(),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    ),
  );
}

class MyHomeContent extends StatefulWidget {
  @override
  _MyHomeContentState createState() => _MyHomeContentState();
}

class _MyHomeContentState extends State<MyHomeContent> {
  @override
  Widget build(BuildContext context) {
    //实现交织动画
    return Center(
      child: ElevatedButton(
        onPressed: () {
          //MaterialPageRoute 默认是从右往左进入，
          // 如果改入从底部开始弹出到顶部,设置MaterialPageRoute 的fullscreenDialog属性，为true就可以
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => ModalPage(), fullscreenDialog: true),
          // );

          //如果想自定义动画

          Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      FadeTransition(
                        child: ModalPage(),
                        opacity: animation1,
                      ),
                  transitionDuration: Duration(seconds: 3)));


          //如果使用命名路由跳转，就需要onGenerateRoute中设置，返回一个widget
        },
        child: Text("普通的Material page route 动画跳转"),
      ),
    );
  }
}

class ModalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("普通的转场动画"),
      ),
      body: Center(
        child: Text("Material Page route animation"),
      ),
    );
  }
}
