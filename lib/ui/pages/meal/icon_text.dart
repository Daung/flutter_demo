import 'package:flutter/material.dart';
import 'package:study_flutter_003/extension/int_fit.dart';

class HorizontalIconText extends StatelessWidget {
  final Icon _icon;
  final String _title;

  HorizontalIconText(this._icon, this._title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _icon,
        SizedBox(
          width: 2.px,
        ),
        Text(_title, style: Theme.of(context).textTheme.bodyText2.copyWith(
          color: Colors.black,
          fontSize: 8.px
        ),),
      ],
    );
  }
}
