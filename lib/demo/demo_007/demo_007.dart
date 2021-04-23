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
  List<Widget> widgets = List.generate(
      190,
          (index) => ListTile(
        leading: Icon(Icons.pets),
        trailing: Icon(Icons.delete),
        title: Text("地址编号 $index"),
        subtitle: Text("电话号码：132792794829"),
        onTap: () {
          print("$index");
        },
      ));

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Text(
            "home address $index",
            textAlign: TextAlign.left,
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.green,
            height: 10,
            thickness: 2,
            indent: 10,
            endIndent: 10,
          );
        },
        itemCount: 100);
  }

  ListView listviewDemo02() {
    return ListView.builder(
        itemCount: 100,
        itemExtent: 70,
        itemBuilder: (context, index) {
          return Text(
            "home address $index",
            textAlign: TextAlign.left,
          );
        });
  }

  ListView listViewDemo01() {
    return ListView(
      //注定item的高度
      itemExtent: 80,
      children: widgets,
    );
  }
}
