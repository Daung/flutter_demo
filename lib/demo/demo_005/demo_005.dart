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
  build(context) => Scaffold(
    appBar: AppBar(
      title: Text("flutter demo 003"),
    ),
    body: MyHomeBody(),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  );
}

class MyHomeBody extends StatefulWidget {
  @override
  createState() => MyHomeBodyState();
}

class MyHomeBodyState extends State<MyHomeBody> {
  @override
  Widget build(BuildContext context) {
    return FlexDemo();
  }
}

class FlexDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //direction: Axis.horizontal, =>Row
    //direction: Axis.vertical, =>Column
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Text("text 001"),
        // Text("text 002"),
        // Text("text 003"),
        // Text("text 004"),

        Container(width: 80,height: 60,color: Colors.red,),
        Container(width: 40,height: 100,color: Colors.green,),
        Container(width: 40,height: 80,color: Colors.blue,),
        Expanded(child: Container(width: 90,height: 80,color: Colors.yellow,))

      ],
    );
  }
}



