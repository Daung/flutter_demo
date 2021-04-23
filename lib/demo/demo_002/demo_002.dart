import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter demo 002"),
      ),
      body: _MyHomeBody(),
    );
  }
}

class _MyHomeBody extends StatefulWidget {
  @override
  createState() => _MyHomeBodyState();
}

class _MyHomeBodyState extends State<_MyHomeBody> {
  bool isChecked = false;

  void _changedValue(bool isCheck) {
    setState(() {
      this.isChecked = isCheck;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(value: isChecked, onChanged: _changedValue),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 100,
            child: Text(isChecked ? "选中" : "未选中"),
          )
        ],
      ),
    );
  }
}