import 'package:flutter/material.dart';
import 'package:study_flutter_003/extension/int_fit.dart';
import 'package:study_flutter_003/ui/pages/draw/meal_filter.dart';

class WZDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //如果要限制draw 的宽度，就嵌套一个container
    return Container(
      width: 120.px,
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _headWidget(context),
            _eatMeal(context, () {
              Navigator.of(context).pop();
            }),
            _filterMeal(context, () {
              Navigator.of(context).pushNamed(WZMealFilterPage.routeName);
            }),
          ],
        ),
      ),
    );
  }
}

Widget _headWidget(BuildContext context) {
  return Container(
    color: Colors.orange,
    height: 100.px,
    child: Text(
      "开始动手",
      style: Theme.of(context).textTheme.bodyText1.copyWith(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.px),
    ),
    alignment: Alignment.bottomCenter,
    padding: EdgeInsets.only(bottom: 10.px),
  );
}

Widget _eatMeal(BuildContext context, Function onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 10.px),
      padding: EdgeInsets.symmetric(horizontal: 10.px),
      child: Row(
        children: [
          Icon(
            Icons.restaurant,
            size: 10.px,
          ),
          SizedBox(
            width: 10.px,
          ),
          Text(
            "进餐",
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Colors.black87,
                  fontSize: 10.px,
                ),
          ),
        ],
      ),
    ),
  );
}

Widget _filterMeal(BuildContext context, Function onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 10.px),
      padding: EdgeInsets.symmetric(horizontal: 10.px),
      child: Row(
        children: [
          Icon(
            Icons.settings,
            size: 10.px,
          ),
          SizedBox(
            width: 10.px,
          ),
          Text(
            "过滤",
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Colors.black87,
                  fontSize: 10.px,
                ),
          ),
        ],
      ),
    ),
  );
}
