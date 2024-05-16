import 'package:flutter/material.dart';
import 'package:codesangam/signup.dart';
import 'package:codesangam/auth.dart';
import 'dart:developer';
import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:codesangam/dashboard.dart';
// import 'package:codesangam/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var semail = await prefs.getString('email');
  // runApp(MaterialApp(
  //   home: email == null ? LoginPage() : MyHomePage(),
  // ));
  runApp(MaterialApp(
    home: semail == null ? LoginPage() : Dashboard(),
  ));
  // runApp(MyApp());
  // runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = AuthService();

  final authService = AuthService();
  bool _showpass = false;
  String email = '';
  String password = '';
  bool _obscureText = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF2F2F2),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
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
                    SizedBox(
                      width: 2,
                    ),
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
                top: 0,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height *
                    0.6, // Adjust the height as needed
                child: Stack(
                  children: [
                    Positioned(
                      left: MediaQuery.of(context).size.width * -0.60,
                      top: MediaQuery.of(context).size.height * -0.25,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 0.3,
                        height: MediaQuery.of(context).size.width / 0.9,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF64B5F6), // Adjust color as desired
                          // color: Color(0xFF6590EB), // Adjust color as desired
                          // color: Color(0xFF4762DA), // Adjust color as desired
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
                          color: Color(0xFF1976D2), // Adjust color as desired
                          // color: Color(0xFF4762DA), // Adjust color as desired
                          // color: Color(0xFF6590EB), // Adjust color as desired
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
                  // alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                      left: MediaQuery.of(context).size.width * -1.1,
                      bottom: MediaQuery.of(context).size.height * -0.3,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 0.41,
                        height: MediaQuery.of(context).size.width / 0.55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF1976D2), // Adjust color as desired
                        ),
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * -0.7,
                      bottom: MediaQuery.of(context).size.height * -0.4,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 0.51,
                        height: MediaQuery.of(context).size.width / 0.69,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFBEE3FF), // Adjust color as desired
                          // color: Color(0xFFE3F2FD), // Adjust color as desired
                          // color: Color(0xFF6590EB), // Adjust color as desired
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome",
                          style: TextStyle(
                            fontFamily: 'losi',
                            fontSize: 45,
                            fontWeight: FontWeight.w800,
                          )),
                      Text("Back",
                          style: TextStyle(
                            fontFamily: 'losi',
                            fontSize: 45,
                            fontWeight: FontWeight.w800,
                          )),
                      Text("Hey! Good to see you again",
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
                          // if (!_showpass) ...[
                          TextFormField(
                            key: ValueKey('email'),
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
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Please Enter valid Email';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                email = value!;
                              });
                            },
                          ),
                          // ],
                          // if (_showpass) ...[
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            child: TextFormField(
                              key: ValueKey('password'),
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
                              validator: (value) {
                                if (value!.length < 6) {
                                  return 'Please Enter Password of min length 6';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                setState(() {
                                  password = value!;
                                });
                              },
                            ),
                          ),
                          // ],
                          // Positioned( // Remove this Positioned widget
                          //   bottom: 0,
                          //   child: Column(
                          //     children: [
                          Container(
                            // Add Container here instead
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
                                _login();
                              },
                              child: Text('Signup'),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Center(
                            child: Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Dont have an account? ',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFFF2F2F2),
                                      )),
                                  InkWell(
                                    onTap: () => _goToSignup(context),
                                    child: Text('Sign Up',
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
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(20.0),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.stretch,
              //     children: <Widget>[
              //       _showpass
              //           ? TextField(
              //               controller: _password,
              //               obscureText: true,
              //               decoration: InputDecoration(
              //                 labelText: 'Password',
              //               ),
              //             )
              //           : TextField(
              //               controller: _email,
              //               decoration: InputDecoration(
              //                 labelText: 'Email',
              //               ),
              //             ),
              //       // SizedBox(height: 20.0),
              //       // ElevatedButton(
              //       //   onPressed: _showpass ? _login : _showPasswordInputField,
              //       //   child: Text(_showpass ? 'Login' : 'Next'),
              //       // ),
              //       // SizedBox(height: 20.0),
              //       // ElevatedButton(
              //       //   onPressed: () {
              //       //     _goToSignup(context);
              //       //   },
              //       //   child: Text('Go to Sign Up'),
              //       // ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _goToSignup(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignupPage()),
    );
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      log("sagar");
      final user =
          await _auth.loginUserWithEmailAndPassword(email, password, context);
      if (user != null) {
        String dateTime = DateTime.now().toString();
        // String email = email.text;
        // String tokenData =
        //     'Email: $email\nDate: $dateTime'; // Use _email.text here
        // String tokenData = 'Date: $dateTime'; // Use _email.text here

        SharedPreferences perf = await SharedPreferences.getInstance();
        await perf.setString('date', dateTime);
        await perf.setString('email', email);
        log("LoggedIn Successfully");
        _goToHome(context);
      }
    }
  }

  void _goToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Dashboard()),
    );
  }
}
