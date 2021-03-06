import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_003/core/model/meal.dart';
import 'package:study_flutter_003/core/viewmodel/favor_view_model.dart';
import 'package:study_flutter_003/ui/pages/meal/meal_detail_content.dart';

class WZMealDetailPage extends StatelessWidget {
  static const routeName = "/meal_detail";

  @override
  Widget build(BuildContext context) {
    WZMealModel _item =
        ModalRoute.of(context).settings.arguments as WZMealModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(_item.title),
      ),
      body: Center(
        child: WZMealDetailContentPage(_item),
      ),
      floatingActionButton: Consumer<WZFavoriteMealViewModel>(
        builder: (context, favorVM, child) {
          bool isContain = favorVM.isContain(_item);
          print(isContain);
          return FloatingActionButton(
            backgroundColor: Colors.white70,
            child: Icon(
              Icons.favorite_border,
              color: isContain ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              if (!isContain) {
                favorVM.addMeal(_item);
              } else {
                favorVM.removeMeal(_item);
              }
            },
          );
        },
      ),
    );
  }
}
