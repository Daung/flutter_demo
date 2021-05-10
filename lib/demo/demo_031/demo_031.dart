import 'package:flutter/material.dart';
import 'package:study_flutter_003/size/size.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //初始化设备信息
    WZDeviceInfo.iniDeviceInfo();
    return MaterialApp(
      // home: MyHomePage(),
      initialRoute: MyHomePage.routeName,
      routes: {
        MyHomePage.routeName: (context) => MyHomePage(),
      },
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const routeName = "/";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("form"),
      ),
      body: Form(
        key: _globalKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "请输入用户名", border: OutlineInputBorder()),
                validator: (value) {
                  if (value.isEmpty) {
                    return "用户名不能为空";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "请输入密码", border: OutlineInputBorder()),
                validator: (value) {
                  if (value.isEmpty) {
                    return "密码不能为空";
                  }
                  return null;
                },
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    if (_globalKey.currentState.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("内容已提交"),
                        backgroundColor: Colors.blue,
                      ));
                    }
                  },
                  child: Text("登陆"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
