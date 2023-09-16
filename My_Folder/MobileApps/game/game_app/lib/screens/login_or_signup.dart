import 'package:flutter/material.dart';
import 'package:game_app/styles/app_styles.dart';
import 'package:game_app/widgets/button.dart';

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
          Button(
              hint: "Create Account",
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              isCreate: true),
          const SizedBox(
            height: 10,
          ),
          const Text("Have an account?",
              style: TextStyle(color: AppColors.white)),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/login'),
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 18.0, color: AppColors.blue),
            ),
          )
        ],
      ),
    );
  }
}
