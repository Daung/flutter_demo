import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_003/core/model/meal.dart';
import 'package:study_flutter_003/core/viewmodel/favor_view_model.dart';
import 'package:study_flutter_003/extension/int_fit.dart';
import 'package:study_flutter_003/ui/pages/meal/icon_text.dart';
import 'package:study_flutter_003/ui/pages/meal/meal_detail.dart';

final radius = 10.px;

class WZMealItem extends StatelessWidget {
  final WZMealModel _meal;

  WZMealItem(this._meal);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, WZMealDetailPage.routeName,
            arguments: _meal);
      },
      child: Card(
        margin: EdgeInsets.only(top: radius, left: radius, right: radius),
        elevation: 5.px,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        child: Column(
          children: [basicInfo(context, _meal), lastRow(_meal)],
        ),
      ),
    );
  }
}

Widget basicInfo(BuildContext context, WZMealModel meal) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius), topRight: Radius.circular(radius)),
    child: Stack(
      children: [
        AspectRatio(
          aspectRatio: 1.8,
          child: Image.network(
            meal.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        titleInfo(context, meal)
      ],
    ),
  );
}

Widget titleInfo(BuildContext context, WZMealModel meal) {
  return Positioned(
    bottom: 10.px,
    right: 5.px,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.px),
        color: Colors.black54,
      ),
      padding:
          EdgeInsets.only(left: 5.px, top: 10.px, bottom: 10.px, right: 100.px),
      child: Text(meal.title,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.white)),
    ),
  );
}

Widget lastRow(WZMealModel meal) {
  return Padding(
    padding: EdgeInsets.all(10.px),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HorizontalIconText(
            Icon(
              Icons.schedule,
              size: 10.px,
            ),
            "${meal.duration}分钟"),
        HorizontalIconText(
            Icon(
              Icons.restaurant,
              size: 10.px,
            ),
            "${meal.complexStr}难度"),
        Consumer<WZFavoriteMealViewModel>(
          builder: (context, favorVM, child) {
            bool isContain = favorVM.isContain(meal);
            return InkWell(
              onTap: () {
                if(isContain) {
                  favorVM.removeMeal(meal);
                }else {
                  favorVM.addMeal(meal);
                }
              },
              child: HorizontalIconText(
                  Icon(
                    Icons.favorite,
                    size: 10.px,
                    color: isContain ? Colors.red : Colors.grey,
                  ),
                  isContain ? "收藏" :"未收藏"),
            );
          },
        )
      ],
    ),
  );
}
