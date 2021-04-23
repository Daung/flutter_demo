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

class MyHomePage extends StatelessWidget {

  //global key 可以实现widget之间的取值
  final GlobalKey<_MyHomeBodyState> _globalKey = GlobalKey();

  build(context) => Scaffold(
    appBar: AppBar(
      title: Text("global key"),
    ),
    body: MyHomeBody(
      key: _globalKey,
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        print(_globalKey.currentState.widget.parent);
        print(_globalKey.currentState.child);
        _globalKey.currentState.childAction();
      },
      child: Icon(Icons.pets),
    ),
  );
}

class MyHomeBody extends StatefulWidget {
  final Key key;

  const MyHomeBody({this.key}) : super(key: key);

  final String parent = "parent";

  @override
  _MyHomeBodyState createState() => _MyHomeBodyState();
}

class _MyHomeBodyState extends State<MyHomeBody> {
  String child = "child";

  void childAction() {
    print("child action");
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("demo "));
  }
}
