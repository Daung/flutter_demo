import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_003/core/viewmodel/favor_view_model.dart';
import 'package:study_flutter_003/ui/pages/meal/meal_item.dart';

class WZFavoritePage extends StatelessWidget {
  static const routeName = "/favorite_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("收藏"),
      // ),
      body: Consumer<WZFavoriteMealViewModel>(
        builder: (context, favorVM, child) {
          return ListView.builder(
              itemCount: favorVM.meals.length,
              itemBuilder: (context, index) {
                return WZMealItem(favorVM.meals[index]);
              });
        },
      ),
    );
  }
}
