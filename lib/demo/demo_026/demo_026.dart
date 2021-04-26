import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  build(context) => MaterialApp(
    // home: MyHomePage(),
    initialRoute: MyHomePage.routeName,
    routes: {
      MyHomePage.routeName: (context) => MyHomePage(),
    },
    debugShowCheckedModeBanner: false,
  );
}

class MyHomePage extends StatelessWidget {
  static const routeName = "/";

  build(context) => Scaffold(
    appBar: AppBar(
      title: Text("hero animation"),
    ),
    body: MyHomeContent(),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    ),
  );
}

class MyHomeContent extends StatefulWidget {
  @override
  _MyHomeContentState createState() => _MyHomeContentState();
}

class _MyHomeContentState extends State<MyHomeContent> {
  @override
  Widget build(BuildContext context) {
    //实现交织动画
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
        itemBuilder: (context, index) {
          String url = "https://picsum.photos/500/500?random=$index";
          return GestureDetector(
            //使用hero包裹需要做动画的widget，设置hero的tag属性，跳转页面要设置相同的tag值
            child: Hero(
              child: Image.network(url),
              tag: url,
            ),
            onTap: () {
              //使用PageRouteBuilder 是因为跳转页面有一个渐变效果，如果使用MaterialPageRoute，会有一个突兀效果
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          FadeTransition(
                            opacity: animation1,
                            child: HeroPage(
                              url: url,
                            ),
                          )));
            },
          );
        });
  }
}

class HeroPage extends StatelessWidget {
  final String url;

  const HeroPage({this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          //需要做动画的widget使用Hero包裹，设置tag相同的属性
          child: Hero(
            tag: url,
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
