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



class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomeState();
  }
}

class _MyHomeState extends State<MyHome> {
  String content;

  void changeText() {
    setState(() {
      content = DateTime.now().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter demo"),
      ),
      body: MyHomeBody(content:content),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:changeText,
      ),
    );
  }
}

class MyHomeBody extends StatelessWidget {
  final String content;
  MyHomeBody({this.content});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(this.content ?? "111"),
    );
  }
}

