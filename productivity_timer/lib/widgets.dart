import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// This class is created just for the custom widgets.

class ProductivityButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;

  // Constructor.
  ProductivityButton(
      {@required this.color,
      @required this.text,
      this.onPressed});

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
