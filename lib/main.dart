import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_003/core/model/category.dart';
import 'package:study_flutter_003/core/viewmodel/meal_view_model.dart';
import 'package:study_flutter_003/size/size.dart';
import 'package:study_flutter_003/theme/theme.dart';
import 'package:study_flutter_003/ui/pages/meal_page.dart';

import 'core/service/json_parse.dart';
import 'extension/int_fit.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => WZMealViewModel(),
      )
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
        MealDetailPage.routeName: (context) => MealDetailPage(),
      },
      theme: WZAppTheme.themeData,
      darkTheme: WZAppTheme.darkThemeData,

      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("mei shi"),
      ),
      body: MyHomeContent(),
      bottomNavigationBar: BottomNavigationBar(
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
              Navigator.pushNamed(context, MealDetailPage.routeName,
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
