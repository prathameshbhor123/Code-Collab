// import 'package:flutter/material.dart';
// import 'dart:developer';
// import 'package:codesangam/auth.dart';
// import 'package:codesangam/login.dart';
// // import 'package:codesangam/main.dart';

// class SignupPage extends StatefulWidget {
//   const SignupPage({Key? key}) : super(key: key);

//   @override
//   _SignupPageState createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   // final _formKey = GlobalKey<FormState>();

//   String firstName = '';
//   String lastName = '';
//   String email = '';
//   String tpassword = '';
//   String copassword = '';

//   final _firstName = TextEditingController();
//   final _lastName = TextEditingController();
//   final _email = TextEditingController();
//   final _password = TextEditingController();

//   bool _showempass = false;
//   bool _obscureText = true;
//   bool _confirmPasswordObscureText = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Color(0xFFF2F2F2),
//       body: SafeArea(
//         child: Stack(
//           fit: StackFit.expand, // Make the Stack fill the entire screen
//           children: [
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               height: MediaQuery.of(context).size.height *
//                   0.6, // Adjust the height as needed
//               child: Stack(
//                 children: [
//                   Positioned(
//                     right: MediaQuery.of(context).size.width * -0.20,
//                     top: MediaQuery.of(context).size.height * -0.58,
//                     child: Container(
//                       width: MediaQuery.of(context).size.width / 0.51,
//                       height: MediaQuery.of(context).size.width / 0.45,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white, // Adjust color as desired
//                       ),
//                     ),
//                   ),
//                   // Big Circle at the top-right corner
//                   Positioned(
//                     left: MediaQuery.of(context).size.width * -0.60,
//                     top: MediaQuery.of(context).size.height * -0.25,
//                     child: Container(
//                       width: MediaQuery.of(context).size.width / 0.3,
//                       height: MediaQuery.of(context).size.width / 0.9,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Color(0xFF64B5F6), // Adjust color as desired
//                         // color: Color(0xFF6590EB), // Adjust color as desired
//                         // color: Color(0xFF4762DA), // Adjust color as desired
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     right: MediaQuery.of(context).size.width * -0.20,
//                     top: MediaQuery.of(context).size.height * 0.15,
//                     child: Container(
//                       width: MediaQuery.of(context).size.width / 2.6,
//                       height: MediaQuery.of(context).size.width / 2.6,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Color(0xFF1976D2), // Adjust color as desired
//                         // color: Color(0xFF4762DA), // Adjust color as desired
//                         // color: Color(0xFF6590EB), // Adjust color as desired
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               child: Stack(
//                 // alignment: Alignment.bottomCenter,
//                 children: [
//                   Positioned(
//                     left: MediaQuery.of(context).size.width * -1.8,
//                     bottom: MediaQuery.of(context).size.height * -1.1,
//                     child: Container(
//                       width: MediaQuery.of(context).size.width / 0.21,
//                       height: MediaQuery.of(context).size.width / 0.35,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Color(0xFF1976D2), // Adjust color as desired
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     right: MediaQuery.of(context).size.width * -0.20,
//                     bottom: MediaQuery.of(context).size.height * -0.12,
//                     child: Container(
//                       width: MediaQuery.of(context).size.width / 1.81,
//                       height: MediaQuery.of(context).size.width / 1.4,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Color(0xFFBEE3FF), // Adjust color as desired
//                         // color: Color(0xFFE3F2FD), // Adjust color as desired
//                         // color: Color(0xFF6590EB), // Adjust color as desired
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               top: 16.0,
//               left: 16.0,
//               child: Row(
//                 children: [
//                   Text('Code',
//                       style: TextStyle(
//                         fontSize: 23,
//                         fontFamily: 'appti',
//                       )),
//                   SizedBox(
//                     width: 2,
//                   ),
//                   Text('Collab',
//                       style: TextStyle(
//                           color: Colors.lightBlue.shade800,
//                           fontFamily: 'appti',
//                           fontSize: 23,
//                           fontWeight: FontWeight.w900)),
//                 ],
//               ),
//             ),
//             Positioned(
//               top: 150,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 30),
//                 child: Column(
//                   children: [
//                     Text("Sign Up",
//                         style: TextStyle(
//                           fontFamily: 'losi',
//                           fontSize: 45,
//                           fontWeight: FontWeight.w800,
//                         )),
//                     Text("Hello! let's join with us ",
//                         style: TextStyle(
//                           fontFamily: 'losi',
//                           fontSize: 15,
//                           fontWeight: FontWeight.normal,
//                         )),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 250),
//               child: Stack(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(14),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         if (!_showempass) ...[
//                           TextField(
//                             controller: _firstName,
//                             key: ValueKey('firstName'),
//                             decoration: InputDecoration(
//                               hintText: 'Enter First Name',
//                               filled: true,
//                               fillColor: Colors.white,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30.0),
//                                 borderSide: BorderSide.none,
//                               ),
//                               contentPadding: EdgeInsets.symmetric(
//                                   vertical: 15.0, horizontal: 20.0),
//                               prefixIcon: Icon(Icons.person),
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Please Enter First Name';
//                               } else {
//                                 return null;
//                               }
//                             },
//                             onChanged: (value) {
//                               setState(() {
//                                 firstName = value;
//                               });
//                             },
//                           ),
//                           SizedBox(height: 20.0),
//                           TextField(
//                             controller: _lastName,
//                             key: ValueKey('lastName'),
//                             decoration: InputDecoration(
//                               hintText: 'Enter Last Name',
//                               filled: true,
//                               fillColor: Colors.white,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30.0),
//                                 borderSide: BorderSide.none,
//                               ),
//                               contentPadding: EdgeInsets.symmetric(
//                                   vertical: 15.0, horizontal: 20.0),
//                               prefixIcon: Icon(Icons.person),
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Please Enter Last Name';
//                               } else {
//                                 return null;
//                               }
//                             },
//                             onChanged: (value) {
//                               setState(() {
//                                 lastName = value;
//                               });
//                             },
//                           ),
//                         ],
//                         if (_showempass) ...[
//                           TextField(
//                             controller: _email,
//                             key: ValueKey('email'),
//                             decoration: InputDecoration(
//                               hintText: 'Enter Email',
//                               filled: true,
//                               fillColor: Colors.white,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30.0),
//                                 borderSide: BorderSide.none,
//                               ),
//                               contentPadding: EdgeInsets.symmetric(
//                                   vertical: 15.0, horizontal: 20.0),
//                               prefixIcon: Icon(Icons.email),
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty || !value.contains('@')) {
//                                 return 'Please Enter valid Email';
//                               } else {
//                                 return null;
//                               }
//                             },
//                             onChanged: (value) {
//                               setState(() {
//                                 email = value;
//                               });
//                             },
//                           ),
//                           Container(
//                             margin: EdgeInsets.symmetric(vertical: 10.0),
//                             child: TextField(
//                               controller: _password,
//                               key: ValueKey('tpassword'),
//                               obscureText: _obscureText,
//                               decoration: InputDecoration(
//                                 hintText: 'Enter Password',
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30.0),
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 contentPadding: EdgeInsets.symmetric(
//                                     vertical: 15.0, horizontal: 20.0),
//                                 prefixIcon: Icon(Icons.lock),
//                                 suffixIcon: IconButton(
//                                   icon: Icon(_obscureText
//                                       ? Icons.visibility
//                                       : Icons.visibility_off),
//                                   onPressed: () {
//                                     setState(() {
//                                       _obscureText = !_obscureText;
//                                     });
//                                   },
//                                 ),
//                               ),
//                               validator: (value) {
//                                 print('Confirm Password: $value');
//                                 print('Password: $tpassword');
//                                 if (value!.length < 6) {
//                                   return 'Please Enter Password of min length 6';
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                               onChanged: (value) {
//                                 tpassword = value;
//                               },
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.symmetric(vertical: 10.0),
//                             child: TextField(
//                               key: ValueKey('copassword'),
//                               obscureText: _confirmPasswordObscureText,
//                               decoration: InputDecoration(
//                                 hintText: 'Confirm Password',
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30.0),
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 contentPadding: EdgeInsets.symmetric(
//                                     vertical: 15.0, horizontal: 20.0),
//                                 prefixIcon: Icon(Icons.lock),
//                                 suffixIcon: IconButton(
//                                   icon: Icon(_confirmPasswordObscureText
//                                       ? Icons.visibility
//                                       : Icons.visibility_off),
//                                   onPressed: () {
//                                     setState(() {
//                                       _confirmPasswordObscureText =
//                                           !_confirmPasswordObscureText;
//                                     });
//                                   },
//                                 ),
//                               ),
//                               onChanged: (value) {
//                                 setState(() {
//                                   copassword = value;
//                                 });
//                               },
//                                validator: (value) => commonValidator(value, password: tpassword, confirmPassword: copassword),
//                             ),
//                           ),
//                         ],
//                         Container(
//                           height: 55,
//                           width: double.infinity,
//                           margin: EdgeInsets.only(
//                             top: 20,
//                             bottom: 50,
//                             left: 20,
//                             right: 20,
//                           ),
//                           child: ElevatedButton(
//                             onPressed: () {
//                               if (!_showempass) {
//                                 setState(() {
//                                   _showempass = true;
//                                 });
//                               } else {
//                                 _signup();
//                               }
//                             },
//                             child: Text(_showempass ? 'Signup' : 'Next'),
//                           ),
//                         ),
//                         SizedBox(height: 20.0),
//                         Center(
//                           child: Container(
//                             // height: 55,
//                             width: double.infinity,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text('You already have an account? ',
//                                     style: TextStyle(
//                                       // fontFamily: 'losi',
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w800,
//                                       // color: Color(0xFFFFFFFF),
//                                       color: Color(0xFFF2F2F2),
//                                     )),
//                                 InkWell(
//                                   onTap: () => _gotologin(context),
//                                   child: Text('Sign Up',
//                                       style: TextStyle(
//                                         // fontFamily: 'losi',
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w800,
//                                         color: Color(0xFF919494),
//                                       )),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _gotologin(BuildContext context) {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => LoginPage()),
//     );
//   }

//   void _signup() async {
//     // if (_formKey.currentState!.validate()) {
//     //   _formKey.currentState!.save();
//     String guid = await AuthService.generateUserId();
//     // String hashedPassword =
//     //     AuthService.hashPassword(password);
//     final user = await AuthService().createUserWithEmailAndPassword(_email.text,
//         guid, _password.text, _firstName.text, _lastName.text, context);
//     if (user != null) {
//       log("LoggedIn Successfully");
//       _gotologin(context);
//     }
//   }

//  String? commonValidator(String? value,
//       {int minLength = 0,
//       bool validEmail = false,
//       String? password,
//       String? confirmPassword}) {
//     if (value == null || value.isEmpty) {
//       return 'This field is required';
//     } else if (minLength > 0 && value.length < minLength) {
//       return 'Please enter at least $minLength characters';
//     } else if (validEmail && !value.contains('@')) {
//       return 'Please enter a valid email';
//     } else if (password != null && value != password) {
//       return 'Passwords do not match';
//     } else if (confirmPassword != null && value != confirmPassword) {
//       return 'Password confirmation does not match';
//     }
//     return null;
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:codesangam/auth.dart';
// // import 'dart:developer';
// // import 'package:codesangam/login.dart';
// // // import 'package:new_prac/main.dart';

// // void main() {
// //   runApp(SignupApp());
// // }

// // class SignupApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Signup Page',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: SignupPage(),
// //     );
// //   }
// // }

// // class SignupPage extends StatefulWidget {
// //   @override
// //   _SignupPageState createState() => _SignupPageState();
// // }

// // class _SignupPageState extends State<SignupPage> {
// //   final _auth = AuthService();

// //   final _firstName = TextEditingController();
// //   final _lastName = TextEditingController();
// //   final _email = TextEditingController();
// //   final _password = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Signup Page'),
// //       ),
// //       body: Padding(
// //         padding: EdgeInsets.all(20.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: <Widget>[
// //             TextField(
// //               controller: _firstName,
// //               decoration: InputDecoration(
// //                 labelText: 'First Name',
// //               ),
// //             ),
// //             SizedBox(height: 20.0),
// //             TextField(
// //               controller: _lastName,
// //               decoration: InputDecoration(
// //                 labelText: 'Last Name',
// //               ),
// //             ),
// //             SizedBox(height: 20.0),
// //             TextField(
// //               controller: _email,
// //               decoration: InputDecoration(
// //                 labelText: 'Email',
// //               ),
// //             ),
// //             SizedBox(height: 20.0),
// //             TextField(
// //               controller: _password,
// //               obscureText: true,
// //               decoration: InputDecoration(
// //                 labelText: 'Password',
// //               ),
// //             ),
// //             SizedBox(height: 20.0),
// //             ElevatedButton(
// //               onPressed: _signup,
// //               child: Text('Signup'),
// //             ),
// //             SizedBox(height: 20.0),
// //             ElevatedButton(
// //               onPressed: () {
// //                 _gotologin(context);
// //               },
// //               child: Text('Go to Login'),
// //               // child: Text('Signup'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   _gotologin(BuildContext context) => Navigator.push(
// //         context,
// //         MaterialPageRoute(builder: (context) => LoginPage()),
// //       );

// //   // _signup() async {
// //   //   final user =
// //   //       await _auth.createUserWithEmailAndPassword(_email.text, _password.text);
// //   //   if (user != null) {
// //   //     log("Created Successfully");
// //   //     _gotologin(context);
// //   //   }
// //   // }

import 'package:flutter/material.dart';
import 'package:codesangam/auth.dart';
import 'package:codesangam/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String tpassword = '';
  String copassword = '';

  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  bool _showempass = false;
  bool _obscureText = true;
  bool _confirmPasswordObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF2F2F2),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Circles
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Stack(
                children: [
                  // Circles on top
                  Positioned(
                    right: MediaQuery.of(context).size.width * -0.20,
                    top: MediaQuery.of(context).size.height * -0.58,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 0.51,
                      height: MediaQuery.of(context).size.width / 0.45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * -0.60,
                    top: MediaQuery.of(context).size.height * -0.25,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 0.3,
                      height: MediaQuery.of(context).size.width / 0.9,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF64B5F6),
                      ),
                    ),
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.width * -0.20,
                    top: MediaQuery.of(context).size.height * 0.15,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.6,
                      height: MediaQuery.of(context).size.width / 2.6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF1976D2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  // Circles at the bottom
                  Positioned(
                    left: MediaQuery.of(context).size.width * -1.8,
                    bottom: MediaQuery.of(context).size.height * -1.1,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 0.21,
                      height: MediaQuery.of(context).size.width / 0.35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF1976D2),
                      ),
                    ),
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.width * -0.20,
                    bottom: MediaQuery.of(context).size.height * -0.12,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.81,
                      height: MediaQuery.of(context).size.width / 1.4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFBEE3FF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 16.0,
              left: 16.0,
              child: Row(
                children: [
                  Text('Code',
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: 'appti',
                      )),
                  SizedBox(width: 2),
                  Text('Collab',
                      style: TextStyle(
                          color: Colors.lightBlue.shade800,
                          fontFamily: 'appti',
                          fontSize: 23,
                          fontWeight: FontWeight.w900)),
                ],
              ),
            ),
            Positioned(
              top: 150,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    Text("Sign Up",
                        style: TextStyle(
                          fontFamily: 'losi',
                          fontSize: 45,
                          fontWeight: FontWeight.w800,
                        )),
                    Text("Hello! let's join with us ",
                        style: TextStyle(
                          fontFamily: 'losi',
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        )),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 250),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // First Name and Last Name
                        if (!_showempass) ...[
                          TextFormField(
                            controller: _firstName,
                            decoration: InputDecoration(
                              hintText: 'Enter First Name',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 20.0),
                              prefixIcon: Icon(Icons.person),
                            ),
                            onChanged: (value) {
                              setState(() {
                                firstName = value;
                              });
                            },
                            validator: (value) =>
                                commonValidator(value, minLength: 1),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _lastName,
                            decoration: InputDecoration(
                              hintText: 'Enter Last Name',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 20.0),
                              prefixIcon: Icon(Icons.person),
                            ),
                            onChanged: (value) {
                              setState(() {
                                lastName = value;
                              });
                            },
                            validator: (value) =>
                                commonValidator(value, minLength: 1),
                          ),
                        ],
                        // Email, Password, Confirm Password
                        if (_showempass) ...[
                          TextFormField(
                            controller: _email,
                            decoration: InputDecoration(
                              hintText: 'Enter Email',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 20.0),
                              prefixIcon: Icon(Icons.email),
                            ),
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                            validator: (value) =>
                                commonValidator(value, validEmail: true),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _password,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 20.0),
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                tpassword = value;
                              });
                            },
                            validator: (value) =>
                                commonValidator(value, minLength: 6),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            obscureText: _confirmPasswordObscureText,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 20.0),
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(_confirmPasswordObscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _confirmPasswordObscureText =
                                        !_confirmPasswordObscureText;
                                  });
                                },
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                copassword = value;
                              });
                            },
                            validator: (value) => commonValidator(value,
                                password: tpassword,
                                confirmPassword: copassword),
                          ),
                        ],
                        // Signup or Next Button
                        Container(
                          height: 55,
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            top: 20,
                            bottom: 50,
                            left: 20,
                            right: 20,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              if (!_showempass) {
                                setState(() {
                                  _showempass = true;
                                });
                              } else {
                                _signup();
                              }
                            },
                            child: Text(_showempass ? 'Signup' : 'Next'),
                          ),
                        ),
                        // Login link
                        SizedBox(height: 20.0),
                        Center(
                          child: Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('You already have an account? ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFFF2F2F2),
                                    )),
                                InkWell(
                                  onTap: () => _gotologin(context),
                                  child: Text('Sign In',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF919494),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _gotologin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void _signup() async {
    print(lastName);
    print(firstName);
    print(email);
    print(tpassword);
    // print(email);
    String guid = await AuthService.generateUserId();
    final user = await AuthService().createUserWithEmailAndPassword(
        guid, firstName, lastName, email, tpassword, context);
    if (user != null) {
      print("LoggedIn Successfully");
      _gotologin(context);
    }
  }

  String? commonValidator(String? value,
      {int minLength = 0,
      bool validEmail = false,
      String? password,
      String? confirmPassword}) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    } else if (minLength > 0 && value.length < minLength) {
      return 'Please enter at least $minLength characters';
    } else if (validEmail && !value.contains('@')) {
      return 'Please enter a valid email';
    } else if (password != null && value != password) {
      return 'Passwords do not match';
    } else if (confirmPassword != null && value != confirmPassword) {
      return 'Password confirmation does not match';
    }
    return null;
  }
}
