import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {

  const RoundedButton({super.key, required this.title, required this.btColor, required this.onPressed});

  final String title;
  final Color btColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: btColor,
        borderRadius: BorderRadius.circular(15.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
