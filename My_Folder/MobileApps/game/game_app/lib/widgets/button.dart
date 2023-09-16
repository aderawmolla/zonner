import 'package:flutter/material.dart';
import 'package:game_app/styles/app_styles.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  Button(
      {super.key,
      required this.hint,
      required this.onPressed,
      required this.isCreate});
  String hint;
  final VoidCallback onPressed;
  final bool isCreate;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(isCreate
            ? AppColors.white
            : AppColors.background), // Background color
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            width: 2.0, // Border width
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Border radius
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(6),
        width: MediaQuery.of(context).size.width * 0.6,
        child: Text(
          hint,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isCreate ? Colors.black : AppColors.white, // Text color
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
