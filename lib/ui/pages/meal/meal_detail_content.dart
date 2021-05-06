import 'package:flutter/material.dart';
import 'package:study_flutter_003/core/model/meal.dart';
import 'package:study_flutter_003/extension/int_fit.dart';

class WZMealDetailContentPage extends StatelessWidget {
  final WZMealModel _mealModel;

  WZMealDetailContentPage(this._mealModel);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _makeImage(_mealModel),
          _makeTitle(context, "制作材料"),
          _makeMaterial(_mealModel),
          _makeTitle(context, "步骤"),
          _makeMealStep(_mealModel),
        ],
      ),
    );
  }
}

Widget _makeImage(WZMealModel mealModel) {
  return AspectRatio(
    aspectRatio: 1.8,
    child: Image.network(
      mealModel.imageUrl,
      fit: BoxFit.cover,
    ),
  );
}

Widget _makeTitle(BuildContext context, String title) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(top: 5.px),
    child: Text(
      title,
      style: Theme.of(context)
          .textTheme
          .bodyText1
          .copyWith(fontWeight: FontWeight.bold, fontSize: 15.px),
    ),
  );
}

Widget _makeCommonListView({WZMealModel mealModel, Widget child}) {
  return Container(
    margin: EdgeInsets.all(10.px),
    padding: EdgeInsets.all(5.px),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.px),
      border: Border.all(color: Colors.grey, width: 1.px),
    ),
    child: child,
  );
}

Widget _makeMaterial(WZMealModel mealModel) {
  return _makeCommonListView(
      mealModel: mealModel,
      child: ListView.builder(
          //内容为包括内容的高度
          shrinkWrap: true,
          //自己不要滚动
          physics: NeverScrollableScrollPhysics(),
          itemCount: mealModel.ingredients.length,
          itemBuilder: (context, index) => Container(
                color: Colors.yellow[100],
                margin: EdgeInsets.all(2.px),
                child: Text(
                  mealModel.ingredients[index],
                ),
              )));
}

Widget _makeMealStep(WZMealModel mealModel) {
  return _makeCommonListView(
      mealModel: mealModel,
      child: ListView.separated(
        //内容为包括内容的高度
        shrinkWrap: true,
        //自己不要滚动
        physics: NeverScrollableScrollPhysics(),
        itemCount: mealModel.steps.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            child: Text(
              "#$index",
            ),
          ),
          title: Text(mealModel.steps[index]),
        ),
        separatorBuilder: (context, index) => Divider(),
      ));
}
