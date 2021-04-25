import 'package:flutter/material.dart';
import 'package:study_flutter_003/route/route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  build(context) => MaterialApp(
        // home: MyHomePage(),
        initialRoute: WZRoute.initialRoute,
        //普通的路由跳转，
        //如果需要参数 传递argument参数
        //然后在跳转的页面使用   ModalRoute.of(context).settings.arguments
        //接收传值
        routes: WZRoute.routes,
        //如果使用命名路由，又需要，有需要在构造函数中传递参数，使用下面的方法
        onGenerateRoute: WZRoute.onGenerateRoute,
        //如果命名路由跳转的页面不存在，会回调这个方法
        onUnknownRoute: WZRoute.onUnknownRoute,
        debugShowCheckedModeBanner: false,
      );
}

class MyHomePage extends StatelessWidget {
  static const routeName = "/";

  build(context) => Scaffold(
        appBar: AppBar(
          title: Text("named route 命名路由"),
        ),
        body: MyHomeContent(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      );
}

class MyHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              //命名路由不带参数
              Navigator.pushNamed(context, WZAboutPage.routeName);
              //命名路由带参数
              Navigator.pushNamed(context, WZAboutPage.routeName,
                  arguments: "这是主页传递到about页面的传值");
            },
            child: Text("跳转到about页面"),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              //假如我们跳转的页面在构造函数中也需要传值，就需要使用 onGenerateRoute函数
              Navigator.pushNamed(context, WZSettingPage.routeName,
                  arguments: "这是主页传递给setting页面的值");
            },
            child: Text("跳转到setting页面"),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              //假如我们跳转的页面不再在，会跳转到配置当中的onUnknownRoute页面
              Navigator.pushNamed(context, WZSettingPage.routeName + "1",
                  arguments: "这是主页传递给setting页面的值");
            },
            child: Text("跳转到错误页面"),
          ),
        ],
      ),
    );
  }
}

class WZAboutPage extends StatelessWidget {
  static const routeName = "/about";

  @override
  Widget build(BuildContext context) {
    String message =
        ModalRoute.of(context).settings.arguments as String ?? "这个是默认值";
    return Scaffold(
      appBar: AppBar(
        title: Text("about page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(fontSize: 30, color: Colors.red),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("返回"))
        ],
      ),
    );
  }
}

class WZUnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String message =
        ModalRoute.of(context).settings.arguments as String ?? "这个是默认值";
    return Scaffold(
      appBar: AppBar(
        title: Text("unknown page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(fontSize: 30, color: Colors.red),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("返回"))
        ],
      ),
    );
  }
}

class WZSettingPage extends StatelessWidget {
  static const routeName = "/setting";

  final String message;

  const WZSettingPage(this.message, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("setting page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(fontSize: 30, color: Colors.red),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("返回"))
        ],
      ),
    );
  }
}
