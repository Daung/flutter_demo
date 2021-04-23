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
      title: Text("Navigator route"),
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
  var message = "message";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          ElevatedButton(
              onPressed: () {
                Future result = Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SecondPage(message: "这是传递过去的消息")));
                result.then((value) {
                  setState(() {
                    if (value != null) {
                      this.message = value;
                    }
                  });
                });
              },
              child: Text("跳转到第二个页面")),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Future result = Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomAppbarBackLogicSecondPage(
                            message: "hahahhaha")));

                result.then((value) {
                  setState(() {
                    if (value != null) {
                      this.message = value;
                    }
                  });
                });
              },
              child: Text("跳转到自定义appbar 返回键逻辑")),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Future result = Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FrameworkSupportAppbarBackLogicSecondPage(
                                message: "hahahhaha")));

                result.then((value) {
                  setState(() {
                    if (value != null) {
                      this.message = value;
                    }
                  });
                });
              },
              child: Text("拦截系统返回键逻辑")),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final message;

  const SecondPage({this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("second page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "这是返回的数据");
                },
                child: Text("back"))
          ],
        ),
      ),
    );
  }
}

//自定义Appbar 返回逻辑，不使用框架默认返回
class CustomAppbarBackLogicSecondPage extends StatelessWidget {
  final message;

  const CustomAppbarBackLogicSecondPage({this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("custom appbar back  page"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context, "这是自定义返回逻辑返回的内容");
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "这是返回的数据");
                },
                child: Text("back"))
          ],
        ),
      ),
    );
  }
}

//使用系统提供的WillPopScope，进行返回键拦截
class FrameworkSupportAppbarBackLogicSecondPage extends StatelessWidget {
  final message;

  const FrameworkSupportAppbarBackLogicSecondPage({this.message});

  @override
  Widget build(BuildContext context) {
    //onWillPop返回false，框架不作处理，教给开发者处理
    //onWillPop 返回true，表示框架处理返回
    return WillPopScope(
      onWillPop: () {
        print("WillPopScope 拦截");
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("WillPopScope page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, "这是WillPopScope返回的数据");
                  },
                  child: Text("back"))
            ],
          ),
        ),
      ),
    );
  }
}
