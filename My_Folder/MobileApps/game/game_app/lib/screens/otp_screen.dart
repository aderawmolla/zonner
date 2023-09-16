import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_app/styles/app_styles.dart';
import 'package:game_app/widgets/button.dart';
import 'package:game_app/widgets/progress_indicator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({
    super.key,
  });
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String? verificationId;
  String smsCode = "";
  String? email;
  String? phoneNo;
  String? password;
  String? fullName;
  bool isLoading = false;
  bool isError = false;
  String otpMessage = "";
  bool isCodeSent = false;
  bool isLogin = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      // Retrieve the arguments using ModalRoute
      final Map<String, dynamic> args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      setState(() {
        // email = args['email'];
        // phoneNo = args['phoneNo'];
        // password = args['password'];
        // fullName = args['fullName'];
        // isLogin = args['isLogin'];
        // print("the phoneNo passed $phoneNo is login $isLogin");
      });

      verifyPhoneNumber(phoneNo ?? "");
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: isLogin
          ? Stack(children: [
              if (isLoading) const Center(child: CustomProgressIndicator()),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   width: size.width * 0.5,
                  //   child: Image.asset('assets/logos/k_logo.jpg'),
                  // ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 28.0, top: 5),
                    child: Column(
                      children: [
                        Text(
                          "OTP VERIFICATION",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Enter the OTP sent to the mobile",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6D6D6D),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "number you entered",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6D6D6D),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 10,
                    ),
                    child: PinCodeTextField(
                      appContext: context,
                      // controller: controller,
                      length: 6,
                      cursorHeight: 19,
                      cursorColor: Colors.black,
                      enableActiveFill: true,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                      boxShadows: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 1,
                          blurStyle: BlurStyle.normal,
                          spreadRadius: 0,
                          offset: const Offset(0, 4),
                        )
                      ],
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        fieldWidth: 50,
                        activeFillColor: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        inactiveColor: Colors.black,
                        borderWidth: 1,
                        activeColor: Colors.blue,
                        selectedColor: Colors.black,
                        selectedFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                      ),
                      onChanged: (value) {
                        setState(() {
                          smsCode = value;
                        });
                        // ignore: avoid_print
                        print(value);
                      },
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6D6D6D),
                        fontSize: 16,
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                          text: "Don't get the code? ",
                        ),
                        TextSpan(
                          text: "Click to Resend",
                          style: const TextStyle(
                            color: AppColors
                                .blue, // Set your desired text color here
                            decoration: TextDecoration
                                .underline, // Add underline decoration
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Add your resend code logic here when "Click to Resend" is tapped
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Button(
                      hint: "Verify",
                      onPressed: () =>
                          Navigator.pushNamed(context, '/game_bord'),
                      isCreate: false)
                ],
              ),
              if (isLoading) const CustomProgressIndicator()
            ])
          : Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(child: CustomProgressIndicator()),
            ),
    );
  }

//verify  phonenumber
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    // setState(() {
    //   isLoading = true;
    // });

    // verificationCompleted(AuthCredential authCredential) async {
    //   print("Phone number automatically verified and signed in.");
    // }

    // verificationFailed(FirebaseAuthException authException) {
    //   setState(() {
    //     isLoading = false;
    //   });
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     backgroundColor: Colors.red,
    //     content: Text('Phone Verification Failed'),
    //   ));
    //   Navigator.pop(context);
    // }

    // codeSent(String verificationId, [int? forceResendingToken]) {
    //   setState(() {
    //     print("now excuted ");

    //     this.verificationId = verificationId;
    //   });
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     backgroundColor: Colors.green,
    //     content: Text('Code Sent To Your Phone'),
    //   ));
    //   setState(() {
    //     isLoading = false;
    //   });
    //   isLogin ? "" : signUpToHasura();
    // }

    // codeAutoRetrievalTimeout(String verificationId) {
    //   setState(() {});
    // }

    // await FirebaseAuth.instance.verifyPhoneNumber(
    //   phoneNumber: phoneNumber,
    //   verificationCompleted: verificationCompleted,
    //   verificationFailed: verificationFailed,
    //   codeSent: codeSent,
    //   codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    // );
  }

// Add a new function to verify the OTP entered by the user
  Future<void> verifyOTP(String otp) async {
    // setState(() {
    //   isLoading = true;
    // });
    // // Create the AuthCredential with the verificationId and the entered OTP
    // AuthCredential authCredential = PhoneAuthProvider.credential(
    //   verificationId: verificationId ?? "",
    //   smsCode: otp,
    // );

    // // Sign in with the AuthCredential
    // try {
    //   UserCredential userCredential =
    //       await FirebaseAuth.instance.signInWithCredential(authCredential);
    //   // Verification successful, you can access the user details through `userCredential.user`

    //   // ignore: use_build_context_synchronously
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     backgroundColor: Colors.green,
    //     content: Text('Sign in successful'),
    //   ));
    //   Navigator.pushNamed(context, '/nav_bar');
    //   print(
    //       "OTP verification successful. User ID: ${userCredential.user?.uid}");
    // } catch (e) {
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     backgroundColor: Colors.red,
    //     content: Text('OTP Verification failed'),
    //   ));
    //   print("OTP verification failed: $e");
    // }
    // setState(() {
    //   isLoading = false;
    // });
  }

// Call this function with the entered OTP to verify it
// Example:
// verifyOTP("123456");

//signup after phone verification
  // void signUpToHasura() async {
  //   try {
  //     bool success = await signUp(
  //       email!,
  //       fullName!,
  //       phoneNo!,
  //       password!,
  //     );
  //     if (success == true) {
  //       // ignore: use_build_context_synchronously
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         backgroundColor: Colors.green,
  //         content: Text('Signup  successfull'),
  //       ));
  //       Navigator.pushNamed(context, '/login');
  //     } else {
  //       // ignore: use_build_context_synchronously
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         backgroundColor: Colors.red,
  //         content: const Text('Signup  failed'),
  //         action: SnackBarAction(
  //             label: "Try Again",
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             }),
  //       ));
  //       print('Signup failed.');
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       backgroundColor: Colors.red,
  //       content: const Text('Error in Signup'),
  //       action: SnackBarAction(
  //           label: "Try Again",
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           }),
  //     ));
  //     // Handle the signup error and display a message to the user.
  //     print('Signup Unsucces: $e');
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }
}
