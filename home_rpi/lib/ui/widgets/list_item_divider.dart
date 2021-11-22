import 'package:flutter/material.dart';

class ListItemDivider extends StatelessWidget {
  const ListItemDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.white,
        Theme.of(context).primaryColorLight,
        Theme.of(context).primaryColor,
        Theme.of(context).primaryColorLight,
        Colors.white
      ])),
      height: 2,
    );
  }
}
