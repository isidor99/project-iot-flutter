import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText(this.icon, this.text, {Key? key}) : super(key: key);

  final IconData icon;
  final String text;

  TextStyle _getTextStyle(BuildContext context) {
    return TextStyle(fontSize: 20, color: Theme.of(context).primaryColor);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          text,
          style: _getTextStyle(context),
        )
      ],
    );
  }
}
