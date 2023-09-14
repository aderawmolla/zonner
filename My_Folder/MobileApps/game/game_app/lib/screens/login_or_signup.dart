import 'package:flutter/material.dart';
import 'package:game_app/styles/app_styles.dart';

class SignupOrLogin extends StatelessWidget {
  const SignupOrLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: AppColors.background),
      child: Column(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/logos/k_logo.jpg')),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  AppColors.white), // Background color
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
              child: const Text(
                textAlign: TextAlign.center,
                "Create Account",
                style: TextStyle(
                  color: Colors.black, // Text color
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Have an account?",
              style: TextStyle(color: AppColors.white)),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Login',
            style: TextStyle(fontSize: 18.0, color: AppColors.blue),
          )
        ],
      ),
    );
  }
}
