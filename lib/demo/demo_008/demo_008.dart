import 'dart:math';

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
    // appBar: AppBar(
    //   title: Text("sliver demo"),
    // ),
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

    ListView();
    //如果直接加padding，上上滚动时，top padding 就会盖住滚动的内容
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text("sliver app bar"),
          flexibleSpace: Image.asset("assets/images/aaa.jpeg", fit: BoxFit.cover,),
          pinned: true,
          expandedHeight: 300,
        ),



        //可以让现实的内容显示在安全区
        SliverSafeArea(
          //可以解决顶部padding 想上滚动时，覆盖的问题
          sliver: SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    color: Color.fromARGB(255, Random().nextInt(256),
                        Random().nextInt(256), Random().nextInt(256)),
                  );
                }, childCount: 9),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10)),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ListTile(
                leading: Icon(Icons.pets),
                title: Text("联系号码 $index"),
                trailing: Icon(Icons.delete),
              );
            }, childCount: 30))
      ],
    );
  }
}
