import 'package:flutter/material.dart';
import 'package:game_app/screens/forgot_password.dart';
import 'package:game_app/screens/game_bord.dart';
import 'package:game_app/screens/login_or_signup.dart';
import 'package:game_app/screens/login_screen.dart';
import 'package:game_app/screens/otp_screen.dart';
import 'package:game_app/screens/signup_screen.dart';
import 'package:game_app/styles/app_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/signup': (context) => const SignUP(),
        '/login': (context) => const logInPage(),
        '/forgot': (context) => const PasswordReset(),
        '/otp': (context) => const OTPScreen(),
        '/game_bord': (context) => const GameBoard()
      },
      title: 'Game App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          shadowColor: AppColors.blue,
          primaryColor: AppColors.white),
      home: const MyHomePage(title: 'Game App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SignupOrLogin());
  }
}
