import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_003/provider/user_view_model.dart';

import '../provider/counter_view_model.dart';
import '../provider/init_provider.dart';

void main() {
  //如果共享一个数据，可以下一个ChangeNotifierProvider对象，如果是多个，因该使用
  // runApp(ChangeNotifierProvider(
  //   create: (context) => WZCounterViewModel(),
  //   child: MyApp(),
  // ));

  //如果共享多个数据  可以使用MultiProvider
  MultiProvider(
    providers: providers,
    child: MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("provider demo"),
      ),
      body: MyBodyPage(),
      //点击事件修改共享的counter的数据，需要Consumer包装一下
      floatingActionButton: FloatingActionButtonTwo(),
    );
  }
}

class FloatingActionButtonOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<WZCounterViewModel>(
      builder: (context, counterVM, child) {
        //好好体会这个方法中的参数child 使用 ，和小面的child赋值
        print("FloatingActionButtonOne build");
        return FloatingActionButton(
          //赋值给child属性
          child: child,
          onPressed: () {
            counterVM.counter += 1;
          },
        );
      },
      //不需要重建的放在child属性当中
      child: Icon(Icons.add),
    );
  }
}

class FloatingActionButtonTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //selector 和consumer不同之处，
    //selector需要传入两个参数 A， S， selector方法参数是A类型，返回S类型，可以做一个转化
    //shouldRebuild 方法如果返回true，表示builder方法依然会被重建即FloatingActionButton 会被重建
    //如果返回false FloatingActionButton 不会被重建
    return Selector<WZCounterViewModel, WZCounterViewModel>(
      selector: (context, counterVM) => counterVM,
      shouldRebuild: (prev, next) => false,
      builder: (context, counterVM, child) {
        //好好体会这个方法中的参数child 使用 ，和小面的child赋值
        print("FloatingActionButtonTwo build");
        return FloatingActionButton(
          //赋值给child属性
          child: child,
          onPressed: () {
            counterVM.counter += 1;
          },
        );
      },
      //不需要重建的放在child属性当中
      child: Icon(Icons.add),
    );
  }
}

class MyBodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyRowOne(),
          MyRowTwo(),
          MyRowThree(),
          MyRowFour(),
          MyRowFive()
        ],
      ),
    );
  }
}

class MyRowOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("MyRowOne build");
    //如果使用provier.of方法那么MyRowOne都会被重建
    int counter = Provider.of<WZCounterViewModel>(context).counter;
    return Text("counter is $counter");
  }
}

class MyRowTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("MyRowTwo build");
    //如果使用provier.of方法那么MyRowOne都会被重建
    int counter = Provider.of<WZCounterViewModel>(context).counter;
    return Text("counter is $counter");
  }
}

class MyRowThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //区别使用provider.of方法，使用consumer,
    print("MyRowThree build");
    return Consumer<WZCounterViewModel>(
      builder: (context, counterVM, child) =>
          Text("counter is ${counterVM.counter}"),
    );
  }
}

class MyRowFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //区别使用provider.of方法，使用consumer,
    print("MyRowFour build");
    return Consumer<WZCounterViewModel>(
      builder: (context, counterVM, child) =>
          Text("counter is ${counterVM.counter}"),
    );
  }
}

//如果既想共享WZCounterViewModel 又想共享WZUserInfoViewModel
//可以使用Consumer2
class MyRowFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<WZCounterViewModel, WZUserInfoViewModel>(
        builder: (context, countVM, userVM, child) =>
            Text("count is ${countVM.counter}, name is ${userVM.user.name}"));
  }
}
