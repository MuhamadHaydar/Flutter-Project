import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// This class is created just for the custom widgets.

class ProductivityButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;

  // Constructor.
  ProductivityButton(
      {@required this.color, @required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      color: color,
      onPressed: onPressed,
    );
  }
}

/*
  In Dart, typedef can be used as a pointer that references a function. This is
  because we want to call the function, with the correct parameters, from the
  relevant button.
 */
typedef CallbackSetting = void Function(String, int);

class SettingButton extends StatelessWidget {
  // Some properties to create the button.
  final Color color;
  final String text;
  final int value;
  final String setting;
  final CallbackSetting callback;

  // SettingButton constructor.
  SettingButton(this.color, this.text, this.value, this.setting, this.callback);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        this.text,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () => this.callback(this.setting, this.value),
      color: this.color,
    );
  }
}
