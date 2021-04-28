import 'package:flutter/cupertino.dart';
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
    theme: ThemeData(
      //primarySwatch传递的是MaterialColor ，我们使用的的color.red[100]
      //是因为MaterialColor重写了[]操作符
        primarySwatch: Colors.blue,
        primaryColor: Colors.green,
        accentColor: Colors.purple,
        textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 12, color: Colors.green),
            bodyText2: TextStyle(fontSize: 18, color: Colors.red)),
        buttonTheme: ButtonThemeData(
            minWidth: 30, height: 150, buttonColor: Colors.orange)),

    debugShowCheckedModeBanner: false,
  );
}

class MyHomePage extends StatelessWidget {
  static const routeName = "/";

  build(context) => Scaffold(
    appBar: AppBar(
      title: Text("Theme page"),
    ),
    body: MyHomeContent(),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => _TestInheritedThemePage()));
      },
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {},
            child: Text(
              "aaa",
              style: TextStyle(fontSize: 20),
            )),
        Switch(
            value: true,
            onChanged: (value) {
              print(value);
            }),
        CupertinoSwitch(value: true, onChanged: (value) {}),
        Text(
          "wang",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          "wang",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}

class _TestInheritedThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //直接这样写，会继承来自全局的themedata
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("测试继承过来的主题"),
    //   ),
    //   body: Center(
    //     child: Text("center"),
    //   ),
    // );

    //使用Theme去包裹Widget,如果直接创建 ThemeData 这样会把全局的主题覆盖掉

    // return Theme(
    //   data: ThemeData(primaryColor: Colors.accents[1]),
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text("测试继承过来的主题"),
    //     ),
    //     body: Center(
    //       child: Text("center"),
    //     ),
    //   ),
    // );

    //不想把全局的主题覆盖掉，只想修改全局主题中的某一个属性的值

    return Theme(
      data: Theme.of(context)
          .copyWith(primaryColor: Colors.amber, accentColor: Colors.red),
      child: Scaffold(
        appBar: AppBar(
          title: Text("测试继承过来的主题"),
        ),
        body: Center(
          child: Text("center"),
        ),
        //floatingActionButton 直接修改accentColor不能修改其背景颜色
        //修改floatingActionbutton要按照下面的方式
        floatingActionButton: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context)
                  .colorScheme
                  .copyWith(secondary: Colors.red)),
          child: FloatingActionButton(
            child: Icon(Icons.pets),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
