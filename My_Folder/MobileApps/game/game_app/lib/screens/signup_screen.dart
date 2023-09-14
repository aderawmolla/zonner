// import 'package:flutter/material.dart';

// // ignore: camel_case_types
// class logInPage extends StatefulWidget {
//   const logInPage({super.key});
//   @override
//   State<logInPage> createState() => _logInPageState();
// }

// // ignore: camel_case_types
// class _logInPageState extends State<logInPage> {
//   late TextEditingController passwordController;
//   late TextEditingController phoneNumberController;
//   bool isObscure = true;
//   bool isValidPassword = true;
//   String passwordMessage = "";
//   bool isLoading = false;
//   String customer_id = "";
//   @override
//   void initState() {
//     super.initState();
//     phoneNumberController = TextEditingController();
//     passwordController = TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Stack(
//           children: [
//             if (isLoading)
//               Container(
//                 color: Colors.black.withOpacity(0.5),
//                 child: const Center(
//                   child: CircularProgressIndicator(
//                     color: Color(
//                         0xFFFAB631), // Customize the color as per your preference
//                   ),
//                 ),
//               ),
//             SingleChildScrollView(
//               child: SafeArea(
//                 child: Column(
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.symmetric(
//                               horizontal: 30, vertical: 90),
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 width: size.width * 0.5,
//                                 child: Image.asset('Assets/Images/Logo.png'),
//                               ),
//                               const SizedBox(
//                                 height: 15,
//                               ),
//                               SizedBox(
//                                 child: PhoneInput(
//                                   setPhoneNumber: setPhoneNumber,
//                                 ),
//                               ),

//                               const SizedBox(height: 20),
//                               Textarea(
//                                 isValid: isValidPassword,
//                                 isPassword: true,
//                                 setObscure: setObscure,
//                                 isObscure: isObscure,
//                                 hint: "password",
//                                 icon: Icons.lock,
//                                 controller: passwordController,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     passwordController.text = value;
//                                   });
//                                 },
//                               ),
//                               if (passwordMessage.isNotEmpty)
//                                 ErrorMessage(message: passwordMessage),
//                               // "Forgot Password" styled text
//                               TextButton(
//                                 onPressed: () => Navigator.pushNamed(
//                                     context, '/resetPassword'),
//                                 child: const Text(
//                                   "Forgot Password?",
//                                   style: TextStyle(
//                                       color: Color(
//                                           0xFFFAB631) // You can customize the text color
//                                       ),
//                                 ),
//                               ),
//                               LoginButton(
//                                 register: true,
//                                 icon: Icons.apple,
//                                 label: "SIGN IN",
//                                 col: const Color(0xFFFAB631),
//                                 Tcol: Colors.black,
//                                 Icol: const Color(0xFFFAB631),
//                                 hasIcon: false,
//                                 onPressed: validateAndSignIn,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }

//   void setObscure() {
//     setState(() {
//       isObscure = !isObscure;
//     });
//   }

//   void validateAndSignIn() {
//     print("message of password ${passwordController.text}");
//     setState(() {
//       //reset the state without refresh
//       passwordMessage = "";
//       isValidPassword = true;
//     });

//     if (passwordController.text.isEmpty) {
//       setState(() {
//         isValidPassword = false;
//         passwordMessage = "Enter password";
//       });
//     }
// // isValidPassword

//     isValidPassword
//         ? checkPasswordAndPhone(
//             passwordController.text, phoneNumberController.text)
//         : null;
//   }

//   void checkPasswordAndPhone(String password, String phoneNUmber) async {
//     print("checking password");
//     setState(() {
//       isLoading = true;
//     });
//     try {
//       String token =
//           await login(phoneNumberController.text, passwordController.text);
//       print("not excuted");
//       if (token.isEmpty) {
//         print("not verified");
//         // ignore: use_build_context_synchronously
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           backgroundColor: Colors.red,
//           content: Text('Verification Failed'),
//         ));
//       } else {
//         print("the token for this user ${token}");
//         Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
//         setState(() {
//           customer_id = decodedToken["https://hasura.io/jwt/claims"]
//               ["x-hasura-customer-id"];
//         });
//         // ignore: use_build_context_synchronously
//         Provider.of<CustomerProvider>(context, listen: false)
//             .getCustomer(customer_id);
//         // ignore: use_build_context_synchronously
//         Navigator.pushNamed(
//           context, '/message_screen', //arguments: {
//           // "customer_id": customer_id,
//           // "phoneNo": phoneNumberController.text,
//           // "password": passwordController.text,
//           // "isLogin": true
//           // }
//         );
//       }
//     } catch (e) {
//       print(e);
//       setState(() {
//         isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         backgroundColor: Colors.red,
//         content: Text("Incorrect Credential"),
//       ));

//       // Handle the signup error and display a message to the user.
//     }
//   }

//   void setPhoneNumber(String value) {
//     setState(() {
//       phoneNumberController.text = value;
//       print("the phone number inside loginpageis ${value}");
//     });
//   }
// }
