import 'package:flutter/material.dart';
import 'package:sum_plugin/sum_plugin.dart';

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
      title: Text("custom plugin"),
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

//创建插件开发的步骤

//使用命名行创建插件  flutter create --org yiban.plugin --template=plugin --platforms=android,ios -a java -i objc sum_plugin

//sum_plugin 就是插件的名称

//我们把写好的插件上传到git仓库，然后在pubspec.yaml 配置

//dependencies:
//   sum_plugin: 看上面的创建插件的命令行  sum_plugin 就是创建的插件的名称
//     git:   git 仓库
//       url: https://github.com/Daung/flutter_plugin.git git 的仓库地址


//引入自己写的插件  import 'package:sum_plugin/sum_plugin.dart';
//调用使用



class _MyHomeContentState extends State<MyHomeContent> {
  int sum = -1;

  @override
  void initState()  {
    initSum();
    super.initState();
  }


  Future<void> initSum() async {
    int sum = await SumPlugin.sum;

    setState(() {
      this.sum = sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("sum is $sum"),
    );
  }


}
