import 'package:flutter/material.dart';
import 'package:study_flutter_003/core/model/meal.dart';
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
      floatingActionButton: FloatingActionButton(child: Icon(Icons.favorite, color: Colors.red,),),
    );
  }
}


