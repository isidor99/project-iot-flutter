import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(this._label, this._onButtonPressed, {Key? key, this.color})
      : super(key: key);

  final String _label;
  final dynamic _onButtonPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: _onButtonPressed,
        child: Text(
          _label,
          style: TextStyle(
              color: color != null ? Theme.of(context).primaryColor : Colors.white),
        ),
        style: TextButton.styleFrom(
            backgroundColor: color ?? Theme.of(context).primaryColor,
            textStyle:
                const TextStyle(fontSize: 18, wordSpacing: 1.5, fontWeight: FontWeight.bold)));
  }
}
