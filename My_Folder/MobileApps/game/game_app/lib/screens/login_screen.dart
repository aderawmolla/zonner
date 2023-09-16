import 'package:flutter/material.dart';
import 'package:game_app/styles/app_styles.dart';
import 'package:game_app/widgets/button.dart';
import 'package:game_app/widgets/error_message.dart';
import 'package:game_app/widgets/phone_input.dart';
import 'package:game_app/widgets/text_area.dart';

// ignore: camel_case_types
class logInPage extends StatefulWidget {
  const logInPage({super.key});
  @override
  State<logInPage> createState() => _logInPageState();
}

// ignore: camel_case_types
class _logInPageState extends State<logInPage> {
  late TextEditingController passwordController;
  late TextEditingController phoneNumberController;
  bool isObscure = true;
  bool isValidPassword = true;
  String passwordMessage = "";
  bool isLoading = false;
  bool pass = false;
  bool rememberMe = false;
  String customer_id = "";
  @override
  void initState() {
    super.initState();
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
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(color: AppColors.blue),
                ),
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
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                child: PhoneInput(
                                  setPhoneNumber: setPhoneNumber,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Textarea(
                                isValid: isValidPassword,
                                isPassword: true,
                                setObscure: setObscure,
                                isObscure: isObscure,
                                hint: "password",
                                icon: Icons.key_sharp,
                                controller: passwordController,
                                onChanged: (value) {
                                  setState(() {
                                    passwordController.text = value;
                                  });
                                },
                              ),
                              if (passwordMessage.isNotEmpty)
                                ErrorMessage(message: passwordMessage),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/forgot'),
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(color: AppColors.blue),
                                ),
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    fillColor: MaterialStateProperty
                                        .resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.selected)) {
                                          // Color when the checkbox is selected (checked)
                                          return AppColors.success;
                                        }
                                        // Color when the checkbox is unselected (unchecked)
                                        return AppColors.white;
                                      },
                                    ),
                                    value: rememberMe,
                                    onChanged: (newValue) {
                                      setState(() {
                                        rememberMe = !rememberMe;
                                      });
                                    },
                                  ),
                                  const Text(
                                    "Remember me",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              Button(
                                  hint: "Login",
                                  onPressed: validateAndSignIn,
                                  isCreate: false),
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
        ));
  }

  void setObscure() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  void validateAndSignIn() {
    print("message of password ${passwordController.text}");
    setState(() {
      //reset the state without refresh
      passwordMessage = "";
      isValidPassword = true;
    });

    if (passwordController.text.isEmpty) {
      setState(() {
        isValidPassword = false;
        passwordMessage = "Enter password";
      });
    }

    isValidPassword
        ? checkPasswordAndPhone(
            passwordController.text, phoneNumberController.text)
        : null;
  }

  void checkPasswordAndPhone(String password, String phoneNUmber) async {
    Navigator.pushNamed(context, '/otp');
    print("checking password");
    setState(() {
      // isLoading = true;
      pass = true;
    });
    // try {
    // String token =
    //     await login(phoneNumberController.text, passwordController.text);
    // print("not excuted");
    // if (token.isEmpty) {
    //   print("not verified");
    // ignore: use_build_context_synchronously
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     backgroundColor: Colors.red,
    //     content: Text('Verification Failed'),
    //   ));
    // } else {
    // print("the token for this user ${token}");
    // Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    // setState(() {
    //   customer_id = decodedToken["https://hasura.io/jwt/claims"]
    //       ["x-hasura-customer-id"];
    // });
    // // ignore: use_build_context_synchronously
    // Provider.of<CustomerProvider>(context, listen: false)
    //     .getCustomer(customer_id);
    // // ignore: use_build_context_synchronously
    // Navigator.pushNamed(
    //   context, '/message_screen', //arguments: {
    // "customer_id": customer_id,
    // "phoneNo": phoneNumberController.text,
    // "password": passwordController.text,
    // "isLogin": true
    // }
    // );
    //   }
    // } catch (e) {
    //   print(e);
    //   setState(() {
    //     isLoading = false;
    //   });
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     backgroundColor: Colors.red,
    //     content: Text("Incorrect Credential"),
    //   ));

    //   // Handle the signup error and display a message to the user.
    // }
  }

  void setPhoneNumber(String value) {
    setState(() {
      phoneNumberController.text = value;
      print("the phone number inside loginpageis ${value}");
    });
  }
}
