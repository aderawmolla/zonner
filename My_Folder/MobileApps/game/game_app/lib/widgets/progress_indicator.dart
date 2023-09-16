import 'package:flutter/material.dart';
import 'package:game_app/styles/app_styles.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.blue,
        ), // Show circular progress indicator overlaid
      ),
    );
  }
}
