import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final Color buttonColor;
  final VoidCallback onPressed;
  final String elevatedButtonText;
  const ElevatedButtonWidget({
    Key? key,
    required this.buttonColor,
    required this.onPressed,
    required this.elevatedButtonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            elevatedButtonText,
          ),
        ),
      ),
    );
  }
}
