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
    return Container(
      // color: Colors.red, color 和 decoration 不能同时存在
      width: 150,
      height: 150,

      // alignment: Alignment.center,
      child: Icon(Icons.pets),
      transform: Matrix4.translationValues(100, 0, 0),
      // transform: Matrix4.translationValues(100, 100, 0),
      // transform: Matrix4.skewX(0.5)
      decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(75),
          boxShadow: [
            //模糊度
            BoxShadow(color:Colors.grey,offset: Offset(5,5), blurRadius: 5)
          ]),
    );
  }
}

class PaddingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text("hello flutter"),
    );
  }
}

class AlignDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Icon(
            Icons.pets,
            size: 100,
          ),
        ),
        Align(
          child: Icon(
            Icons.pets,
            size: 100,
          ),
        ),
        Container(
          child: Align(
            alignment: Alignment(0, 1),
            child: Icon(Icons.pets),
          ),
          height: 150,
        )
      ],
    );
  }
}

class FormDemo extends StatelessWidget {
  var userName = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: userName,
          decoration: InputDecoration(
            labelText: "user name",
            icon: Icon(Icons.people),
            hintText: "请输入用户名",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
            filled: true,
            fillColor: Colors.red[100],
          ),
          onChanged: (result) {
            print(result);
          },
          onSubmitted: (result) {
            print(result);
          },
        ),
        TextField(
          controller: password,
          decoration: InputDecoration(
              icon: Icon(Icons.lock),
              border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              labelText: "password",
              hintText: "please input password"),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 200,
          child: ElevatedButton(
            onPressed: () {
              String name = userName.value.text;
              String password = this.password.value.text;

              print("user is $name, password is $password");
            },
            child: Text("submit"),
          ),
        )
      ],
    );
  }
}
