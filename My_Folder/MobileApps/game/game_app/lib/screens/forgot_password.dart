import "package:flutter/material.dart";
import "package:game_app/widgets/button.dart";
import "package:game_app/widgets/error_message.dart";
import "package:game_app/widgets/progress_indicator.dart";
import "package:game_app/widgets/text_area.dart";

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  late TextEditingController emailController;

  late bool _isResetEmailSent = false;
  String emailMessage = "";
  bool isLoading = false;
  bool isValidEmail = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    // Call the function to handle dynamic links
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(child: CustomProgressIndicator()),
            ),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 90),
                        child: Column(
                          children: [
                            // SizedBox(
                            //   width: size.width * 0.5,
                            //   child: Image.asset('Assets/Images/Logo.png'),
                            // ),
                            const SizedBox(height: 20),
                            Textarea(
                              isValid: isValidEmail,
                              isPassword: false,
                              isObscure: false,
                              hint: "Email Address",
                              icon: Icons.email,
                              controller: emailController,
                              onChanged: (value) {
                                setState(() {
                                  emailController.text = value;
                                });
                              },
                            ),

                            if (emailMessage.isNotEmpty)
                              ErrorMessage(message: emailMessage),
                            // "Forgot Password" styled text
                            const SizedBox(
                              height: 20,
                            ),
                            Button(
                              isCreate: false,
                              hint: "Send Reset Link",
                              onPressed: validateAndSignup,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void validateAndSignup() {
    setState(() {
      // Reset the state without refresh
      emailMessage = "";
      isValidEmail = true;
    });

    if (emailController.text.isEmpty) {
      setState(() {
        emailMessage = "Enter Email";
        isValidEmail = false;
      });
    } else if (!validateEmail(emailController.text)) {
      setState(() {
        emailMessage = "Invalid Email";
        isValidEmail = false;
      });
    }
    isValidEmail ? sendResetEmail() : null;
  }

  bool validateEmail(String email) {
    // Regular expression pattern for validating email
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  void sendResetEmail() async {
    setState(() {
      isLoading = true;
      _isResetEmailSent =
          false; // Reset the flag before attempting to send the email
    });

    String email = emailController.text.trim();
  }
}
