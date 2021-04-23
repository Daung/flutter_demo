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
      title: Text("flutter demo"),
    ),
    body: MyHomeBody(),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    ),
  );
}

class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // width: double.infinity,
      color: Colors.grey,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.asset(
            "assets/images/aaa.jpeg",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all( 10),
              child: Text("data"),
              color: Colors.grey[100],
            ),
          ),

          Align(child: Icon(Icons.pets, size: 50,), alignment: Alignment(1,1),)
        ],
      ),
    );
  }
}
