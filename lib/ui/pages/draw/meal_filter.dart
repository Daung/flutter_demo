import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_003/core/viewmodel/filter_view_model.dart';
import 'package:study_flutter_003/extension/int_fit.dart';

class WZMealFilterPage extends StatelessWidget {
  static const routeName = "/filter_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美食过滤"),
      ),
      body: _WZMealFilterContentPage(),
    );
  }
}

class _WZMealFilterContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _titleWidget(context),
        _filterWidget(context),
      ],
    );
  }
}

Widget _titleWidget(BuildContext context) {
  return Text("展示你的选择",
      style: Theme.of(context).textTheme.bodyText1.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18.px,
          ));
}

List<String> _items = ["无谷蛋白", "不含乳糖", "素食主义", "严格素食主义"];

Widget _filterWidget(BuildContext context) {
  return Expanded(
    child: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_items[index]),
            subtitle: Text(
              _items[index],
              style: TextStyle(fontSize: 10.px),
            ),
            trailing: Consumer<WZFilterViewModel>(
              builder: (context, filterVM, child) {
                bool isCheck = false;
                switch (index) {
                  case 0:
                    isCheck = filterVM.isGlutenFree;
                    break;
                  case 1:
                    isCheck = filterVM.isLactoseFree;
                    break;
                  case 2:
                    isCheck = filterVM.isVegetarian;
                    break;
                  case 3:
                    isCheck = filterVM.isVegan;
                    break;
                }
                return Switch(
                  value: isCheck,
                  onChanged: (value) {
                    switch (index) {
                      case 0:
                        filterVM.isGlutenFree = value;
                        break;
                      case 1:
                        filterVM.isLactoseFree = value;
                        break;
                      case 2:
                        filterVM.isVegetarian = value;
                        break;
                      case 3:
                        filterVM.isVegan = value;
                        break;
                    }
                  },
                );
              },
            ),
          );
        }),
  );
}
