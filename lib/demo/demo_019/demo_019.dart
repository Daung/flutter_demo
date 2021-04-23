import 'package:flutter/material.dart';
import 'package:study_flutter_003/bean/user_info.dart';
import 'package:study_flutter_003/bus/bus.dart';

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
          title: Text("event bus"),
        ),
        body: MyHomeContent(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            EventBusHelper.fire(UserInfo(name: "wzy", age: 5));
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
  var message = "message";

  @override
  void initState() {
    super.initState();
    EventBusHelper.listen<UserInfo>(callback: (data) {
      setState(() {
        message = "name is ${data.name}, age is ${data.age}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
