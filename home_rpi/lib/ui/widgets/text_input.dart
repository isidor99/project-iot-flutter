import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput(this._label, this._controller,
      {Key? key,
      this.keyboardType = TextInputType.name,
      this.textCapitalization = TextCapitalization.none,
      this.color})
      : super(key: key);

  final String _label;
  final TextEditingController _controller;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: TextStyle(fontSize: 18.0, color: color ?? Theme.of(context).primaryColor),
        controller: _controller,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        cursorColor: color ?? Theme.of(context).primaryColor,
        decoration: InputDecoration(
            label: Text(_label, style: TextStyle(color: color ?? Theme.of(context).primaryColor)),
            contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: color ?? Theme.of(context).primaryColor, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: color ?? Theme.of(context).primaryColor, width: 2))));
  }
}
