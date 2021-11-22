import 'package:flutter/material.dart';

class GroupedListHeader extends StatelessWidget {
  const GroupedListHeader(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }
}
