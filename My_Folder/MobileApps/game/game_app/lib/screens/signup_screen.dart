import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:game_app/styles/app_styles.dart';
import 'package:game_app/widgets/button.dart';
import 'package:game_app/widgets/error_message.dart';
import 'package:game_app/widgets/phone_input.dart';
import 'package:game_app/widgets/text_area.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  final String label = "Sign up";
  final IconData icon = Icons.apple;
  late TextEditingController? fullNameController;
  late TextEditingController? emailController;
  late TextEditingController? phoneNumberController;
  late TextEditingController? passwordController;
  String signUpMessage = "";
  bool isSignUp = false;
  bool isObscure = true;
  bool isPassword = true;
  String passwordMessage = "";
  String emailMessage = "";
  String fullNameMessage = "";
  String checkUser = "";
  bool isValidFullName = true;
  bool isValidEmail = true;
  bool isValidPassword = true;
  bool isAllValid = true;
  bool isLoading = false;
  bool agree = false;
  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(
                color: AppColors
                    .blue, // Customize the color as per your preference
              ),
            ),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(
                          //   width: size.width * 0.5,
                          //   // height: size.height,
                          //   child: Image.asset('assets/logos/k_logo.j'),
                          // ),
                          Text(
                            "SIGN UP",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Enter your details to experience the",
                            style: TextStyle(
                                color: Color(0xFF6D6D6D),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "application",
                            style: TextStyle(
                                color: Color(0xFF6D6D6D),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 50.0,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        PhoneInput(
                          setPhoneNumber: setPhoneNumber,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Textarea(
                            isValid: isValidFullName,
                            isPassword: false,
                            isObscure: false,
                            hint: "Full Name",
                            icon: EvaIcons.person,
                            controller:
                                fullNameController ?? TextEditingController(),
                            onChanged: (value) {
                              setState(() {
                                fullNameController?.text = value;
                              });
                            }),
                        if (fullNameMessage.isNotEmpty)
                          ErrorMessage(message: fullNameMessage),
                        const SizedBox(
                          height: 20,
                        ),
                        Textarea(
                            isValid: isValidEmail,
                            isPassword: false,
                            isObscure: false,
                            hint: "Email Address",
                            icon: Icons.email,
                            controller:
                                emailController ?? TextEditingController(),
                            onChanged: (value) {
                              setState(() {
                                emailController?.text = value;
                              });
                            }),
                        if (emailMessage.isNotEmpty)
                          ErrorMessage(message: emailMessage),
                        const SizedBox(
                          height: 20,
                        ),
                        Textarea(
                            isValid: isValidPassword,
                            isPassword: true,
                            setObscure: setObscure,
                            isObscure: isObscure,
                            hint: "password",
                            icon: Icons.lock,
                            controller:
                                passwordController ?? TextEditingController(),
                            onChanged: (value) {
                              setState(() {
                                passwordController?.text = value;
                              });
                            }),
                        if (passwordMessage.isNotEmpty)
                          ErrorMessage(message: passwordMessage),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              const Text(
                                "Have already an account? ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: AppColors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Button(
                        hint: "Register",
                        isCreate: false,
                        onPressed: validateAndSignup,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                            fillColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  // Color when the checkbox is selected (checked)
                                  return AppColors.success;
                                }
                                // Color when the checkbox is unselected (unchecked)
                                return AppColors.white;
                              },
                            ),
                            value: agree,
                            onChanged: (newValue) {
                              setState(() {
                                agree = !agree;
                              });
                            },
                          ),
                          const Column(
                            children: [
                              Text(
                                "By Continuing you agree to our terms of service",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                                overflow: TextOverflow.visible,
                              ),
                              Text(
                                "and privacy policy ",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                                overflow: TextOverflow.visible,
                              ),
                            ],
                          )
                        ],
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

  void setObscure() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  void setPhoneNumber(String value) {
    setState(() {
      phoneNumberController!.text = value;
      print("the phone number inside sign up page is ${value}");
    });
  }

  void validateAndSignup() {
    setState(() {
      //reset the state without refresh
      passwordMessage = "";
      emailMessage = "";
      fullNameMessage = "";
      isValidFullName = true;
      isValidPassword = true;
      isValidEmail = true;
      isAllValid = true;
    });

    if (fullNameController!.text.isEmpty) {
      isValidFullName = false;
      isAllValid = false;
      fullNameMessage = "Enter FullName";
    }

    if (passwordController!.text.isEmpty) {
      setState(() {
        isAllValid = false;
        isValidPassword = false;
        passwordMessage = "Enter password";
      });
    }
    if (emailController!.text.isEmpty) {
      setState(() {
        isAllValid = false;
        emailMessage = "Enter Email";
        isValidEmail = false;
      });
    } else if (!validateEmail(emailController!.text)) {
      setState(() {
        isAllValid = false;
        emailMessage = "Invalid Email";
        isValidEmail = false;
      });
    }

    isAllValid
        ? checkEmailAndPhone(emailController!.text, phoneNumberController!.text)
        : null;
  }

  bool validateEmail(String email) {
    //Regular expression pattern for validating email
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  void checkEmailAndPhone(String email, String phoneNUmber) async {
    // print("checking email");
    // setState(() {
    //   isLoading = true;
    // });
    // try {
    //   // bool success = await findCustomer(
    //   //   emailController!.text,
    //   //   phoneNumberController!.text,
    //   // );
    //   setState(() {
    //     isLoading = false;
    //   });
    //   if (success == true) {
    //     print("user exist");
    //     // ignore: use_build_context_synchronously
    //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //       backgroundColor: Colors.red,
    //       content: Text('User Already Exist'),
    //     ));
    //   } else {
    //     // ignore: use_build_context_synchronously
    //     Navigator.pushNamed(context, '/OTP', arguments: {
    //       "email": emailController!.text,
    //       "phoneNo": phoneNumberController!.text,
    //       "password": passwordController!.text,
    //       "fullName": fullNameController!.text,
    //       "isLogin": false
    //     });
    //   }
    // } catch (e) {
    //   setState(() {
    //     isLoading = false;
    //   });
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     backgroundColor: Colors.red,
    //     content: const Text("Signup  Error"),
    //     action: SnackBarAction(
    //         textColor: Colors.white,
    //         label: "Try Again",
    //         onPressed: () => Navigator.pop(context)),
    //   ));

    //   // Handle the signup error and display a message to the user.
    // }
  }
}
