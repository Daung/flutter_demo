import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_003/core/model/category.dart';
import 'package:study_flutter_003/core/viewmodel/favor_view_model.dart';
import 'package:study_flutter_003/core/viewmodel/meal_view_model.dart';
import 'package:study_flutter_003/size/size.dart';
import 'package:study_flutter_003/theme/theme.dart';
import 'package:study_flutter_003/ui/pages/favor/favorite.dart';
import 'package:study_flutter_003/ui/pages/meal/meal_detail.dart';
import 'package:study_flutter_003/ui/pages/meal/meal_page.dart';

import 'core/service/json_parse.dart';
import 'extension/int_fit.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => WZMealViewModel(),
      ),
      ChangeNotifierProvider(create: (context) => WZFavoriteMealViewModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //初始化设备信息
    WZDeviceInfo.iniDeviceInfo();
    return MaterialApp(
      // home: MyHomePage(),
      initialRoute: MyHomePage.routeName,
      routes: {
        MyHomePage.routeName: (context) => MyHomePage(),
        WZMealPage.routeName: (context) => WZMealPage(),
        WZMealDetailPage.routeName: (context) => WZMealDetailPage(),
        WZFavoritePage.routeName: (context) => WZFavoritePage(),
      },
      theme: WZAppTheme.themeData,
      darkTheme: WZAppTheme.darkThemeData,

      debugShowCheckedModeBanner: false,
    );
  }
}

final List<String> names = ["首页", "收藏"];

class MyHomePage extends StatefulWidget {
  static const routeName = "/";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(names[_index]),
      ),
      body: IndexedStack(
        index: _index,
        children: [
          MyHomeContent(),
          WZFavoritePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "收藏")
        ],
      ),
    );
  }
}

class MyHomeContent extends StatefulWidget {
  @override
  _MyHomeContentState createState() => _MyHomeContentState();
}

class _MyHomeContentState extends State<MyHomeContent> {
  List<WZCategoryModel> _categories = [];

  @override
  void initState() {
    JsonParse.getCategoryData().then((value) {
      setState(() {
        _categories = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(10.px),
        itemCount: _categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10.px, crossAxisSpacing: 10.px),
        itemBuilder: (context, index) {
          Color bgColor = _categories[index].cColor;
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, WZMealPage.routeName,
                  arguments: _categories[index]);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.px),
                  gradient: LinearGradient(
                      colors: [bgColor.withOpacity(0.5), bgColor])),
              child: Text(
                _categories[index].title,
                style: TextStyle(color: Colors.black, fontSize: 18.px),
              ),
            ),
          );
        });
  }
}
