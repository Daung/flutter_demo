import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_003/core/model/category.dart';
import 'package:study_flutter_003/core/model/meal.dart';
import 'package:study_flutter_003/core/viewmodel/meal_view_model.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = "/meal";

  @override
  Widget build(BuildContext context) {
    WZCategoryModel category =
        ModalRoute.of(context).settings.arguments as WZCategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Selector<WZMealViewModel, List<WZMealModel>>(
        //selector 就是过滤的函数
          selector: (context, mealVM) => mealVM.meals
              .where((element) => element.categories.contains(category.id))
              .toList(),
          //ListEquality 判断两个list是否相等
          shouldRebuild: (prev, next) => ListEquality().equals(prev, next),
          builder: (context, meals, child) {
            return ListView.builder(
                itemCount: meals.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(meals[index].title),
                  );
                });
          }),
    );
  }
}
