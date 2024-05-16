import 'package:codesangam/html_editor.dart';
import 'package:codesangam/try.dart';
import 'package:codesangam/utils.dart';
import 'package:codesangam/home_page.dart';
import 'package:codesangam/profilepage.dart';
import 'package:codesangam/challenges.dart';
import 'package:codesangam/splash_screen.dart';
import 'package:codesangam/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:codesangam/auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:codesangam/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'register_web_webview_stub.dart'
    if (dart.library.html) 'register_web_webview.dart';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:codesangam/Intropage.dart';
// import 'package:codesangam/ui_helper/util.dart';
// import 'package:intl/intl.dart';
// import 'package:codesangam/splash_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:codesangam/auth.dart';
// import 'dart:developer';
// import 'package:codesangam/login.dart';
// import 'package:codesangam/dashboard.dart';
// import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCWU5NVBYLQV960cVNHIQhmMdBv11K-Tvs",
            authDomain: "codecollab-ea6da.firebaseapp.com",
            projectId: "codecollab-ea6da",
            storageBucket: "codecollab-ea6da.appspot.com",
            messagingSenderId: "270916671348",
            appId: "1:270916671348:web:3e27f2b69626a65bf53e21",
            measurementId: "G-VCKD5WJJBL"));
  } else {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCWU5NVBYLQV960cVNHIQhmMdBv11K-Tvs",
        appId: "1:270916671348:web:3e27f2b69626a65bf53e21",
        messagingSenderId: "270916671348",
        projectId: "codecollab-ea6da",
      ),
    );
    FirebaseStorage storage = FirebaseStorage.instance;
    storage.refFromURL('gs://codecollab-ea6da.appspot.com');
  }
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // var email = await prefs.getString('email');
  // // runApp(MaterialApp(
  // //   home: email == null ? LoginPage() : MyHomePage(),
  // // ));
  // runApp(MaterialApp(
  //   home: email == null ? LoginPage() : Dashboard(),
  // ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
          titleMedium: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
          ),
          titleSmall: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            color: Colors.grey,
          ),
        ),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Practice App'),
      home: SplashScreen(),
    );
  }
}

var scnames = [
  'Sagar',
  'Khade',
  'Masaye',
  'Prasanna',
  'Vineet',
  'Mehtab',
  'Farooq'
];

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _auth = AuthService();

  String email = "";
  String datee = "";
  String name = "";
  String uid = "";
  String username = "";

  Future getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userEmail = prefs.getString('email');
    String? ldate = prefs.getString('date');
    if (userEmail != null && ldate != null) {
      setState(() {
        email = userEmail;
        datee = ldate;
      });
      print("Email retrieved from SharedPreferences: $email\nDate: $ldate");
    }
  }

  void fetchAndPrintUsers() async {
    List<UserData> users =
        await fetchUserData('Users'); // Fetch users from Firestore
    print('Users:');
    users.forEach((user) {
      if (user.email == email) {
        setState(() {
          name = user.firstName;
          username = user.username;
          uid = user.uid;
        });
      }
      // print('Email: ${user.email}');
    });
    print('\n');
    print('Name: $name');
    print('Name: $uid');
    print('Name: $username');
  }

  @override
  void initState() {
    super.initState();
    getEmail();
    fetchAndPrintUsers();
  }

  var emal = TextEditingController();
  var upass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // var time = DateTime.now();
    final _auth = AuthService();
    var conam = [
      Colors.purple,
      Colors.indigo,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.red,
    ];

    // print('Name: $name');
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: FlexibleSpaceBar(
          title: Row(
            children: [
              Text('Code',
                  style: TextStyle(
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
          background: Container(
            // color: Colors.cyan.shade900,
            // color: Colors.indigo.shade900,
            color: Colors.lightBlueAccent,
            // color: Colors.lightBlue.shade900,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/Samosa.jpg'),
                    backgroundColor: Colors.white54,
                    // child: Icon(
                    //   Icons.account_circle_rounded,
                    //   color: Colors.white60,
                    //   size: 60,
                    // ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: Text('Name: $name',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.lightBlue.shade900))),
                      Container(
                          child: Text('Username: \n $username',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.lightBlue.shade900,
                                  fontStyle: FontStyle.italic))),
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              title: Text('User'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () async {
                await _auth.signout();
                _gotologin(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildGrid(context, Colors.blue.shade100, Colors.blue.shade200),
            SizedBox(height: 40),
            Text(
              'Previous Projects',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            buildData(context, Colors.blue.shade50, Colors.blue.shade300),
            SizedBox(height: 20),
            // buildGrid(context, Colors.green.shade100, Colors.green.shade200),
            // SizedBox(height: 20),
            // buildGrid(context, Colors.yellow.shade100, Colors.yellow.shade200),
            // SizedBox(height: 20),
            // buildGrid(context, Colors.purple.shade100, Colors.purple.shade200),
            // SizedBox(height: 20),
            // buildGrid(context, Colors.orange.shade100, Colors.orange.shade200),
            // SizedBox(height: 20),
            // buildGrid(context, Colors.red.shade100, Colors.red.shade200),
            // SizedBox(height: 20),
            // buildGrid(context, Colors.black54, Colors.black87),
          ],
        ),
      ),
    );
  }

  Widget buildGrid(BuildContext context, colname, brcna) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        children: [
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                color: colname,
                borderRadius: BorderRadius.all(Radius.circular(21)),
                border: Border.all(
                  color: brcna,
                  width: 1,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                child: Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.create_new_folder,
                        color: Colors.white54,
                        size: 45,
                      ),
                      Text(
                        'New Project',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HtmlEditor(),
                ),
              );
            },
          ),
          Container(
            decoration: BoxDecoration(
              color: colname,
              borderRadius: BorderRadius.all(Radius.circular(21)),
              border: Border.all(
                color: brcna,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Column(
                children: [
                  Center(
                    child: FaIcon(
                      FontAwesomeIcons.folderOpen,
                      color: Colors.white54,
                      size: 35,
                    ),
                  ),
                  Text(
                    'Create New Project File',
                    style: TextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: colname,
              borderRadius: BorderRadius.all(Radius.circular(21)),
              border: Border.all(
                color: brcna,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
              child: Column(
                children: [
                  Center(
                    child: FaIcon(
                      FontAwesomeIcons.userNinja,
                      color: Colors.white54,
                      size: 35,
                    ),
                  ),
                  Text(
                    'Friends',
                    style: TextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                color: colname,
                borderRadius: BorderRadius.all(Radius.circular(21)),
                border: Border.all(
                  color: brcna,
                  width: 1,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Center(
                  child: Column(
                    children: [
                      Center(
                        child: FaIcon(
                          FontAwesomeIcons.html5,
                          color: Colors.white54,
                          size: 35,
                        ),
                      ),
                      Text(
                        'HTML Challenges',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizPage(),
                ),
              );
            },
          ),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                color: colname,
                borderRadius: BorderRadius.all(Radius.circular(21)),
                border: Border.all(
                  color: brcna,
                  width: 1,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  children: [
                    Center(
                      child: FaIcon(
                        FontAwesomeIcons.css3,
                        color: Colors.white54,
                        size: 35,
                      ),
                    ),
                    Center(
                      child: Text(
                        'CSS Challenges',
                        style: TextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
          Container(
            decoration: BoxDecoration(
              color: colname,
              borderRadius: BorderRadius.all(Radius.circular(21)),
              border: Border.all(
                color: brcna,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Column(
                children: [
                  Center(
                    child: FaIcon(
                      FontAwesomeIcons.js,
                      color: Colors.white54,
                      size: 35,
                    ),
                  ),
                  Center(
                    child: Text(
                      'JS Challenges',
                      style: TextStyle(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildData(BuildContext context, colname, brcna) {
    return Center(
      child: SizedBox(
        width: 400,
        // height: 00,
        child: Center(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.cyan.shade100,
                  // color: colname,
                  borderRadius: BorderRadius.all(Radius.circular(21)),
                  border: Border.all(
                    color: Colors.cyan.shade200,
                    width: 1.5,
                  ),
                ),
                width: 300,
                height: 300,
                // color: Colors.black,
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Project Details(Name lastedited accessed by etc)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ), //Text
                // child: Text(
                //   'Project Code',
                //   style: TextStyle(
                //     fontSize: 13,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black54,
                //   ),
                // ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(21)),
                  border: Border(
                      bottom: BorderSide(
                    width: 1.8,
                    color: Colors.grey.shade300,
                  )),
                ),
                // color: Colors.red,
                width: 300,
                height: 150,
                child: Text('Project Code'),
                // color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _gotologin(BuildContext context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  Future _gotomain(BuildContext context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  }
}











// import 'package:codesangam/html_editor.dart';
// import 'package:codesangam/try.dart';
// import 'package:codesangam/challenges.dart';
// import 'package:codesangam/splash_screen.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// // import 'package:codesangam/auth.dart';
// import 'dart:developer';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'register_web_webview_stub.dart'
//     if (dart.library.html) 'register_web_webview.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   if (kIsWeb) {
//     await Firebase.initializeApp(
//         options: FirebaseOptions(
//             apiKey: "AIzaSyCWU5NVBYLQV960cVNHIQhmMdBv11K-Tvs",
//             authDomain: "codecollab-ea6da.firebaseapp.com",
//             projectId: "codecollab-ea6da",
//             storageBucket: "codecollab-ea6da.appspot.com",
//             messagingSenderId: "270916671348",
//             appId: "1:270916671348:web:3e27f2b69626a65bf53e21",
//             measurementId: "G-VCKD5WJJBL"));
//   } else {
//     await Firebase.initializeApp(
//       options: FirebaseOptions(
//         apiKey: "AIzaSyCWU5NVBYLQV960cVNHIQhmMdBv11K-Tvs",
//         appId: "1:270916671348:web:3e27f2b69626a65bf53e21",
//         messagingSenderId: "270916671348",
//         projectId: "codecollab-ea6da",
//       ),
//     );
//   }
//   // SharedPreferences prefs = await SharedPreferences.getInstance();
//   // var email = await prefs.getString('email');
//   // // runApp(MaterialApp(
//   // //   home: email == null ? LoginPage() : MyHomePage(),
//   // // ));
//   // runApp(MaterialApp(
//   //   home: email == null ? LoginPage() : Dashboard(),
//   // ));
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Colors.red,
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: FlexibleSpaceBar(
//           title: Row(
//             children: [
//               Text('Code',
//                   style: TextStyle(
//                     fontFamily: 'appti',
//                   )),
//               SizedBox(
//                 width: 2,
//               ),
//               Text('Collab',
//                   style: TextStyle(
//                       color: Colors.lightBlue.shade800,
//                       fontFamily: 'appti',
//                       fontSize: 23,
//                       fontWeight: FontWeight.w900)),
//             ],
//           ),
//           background: Container(
//             // color: Colors.cyan.shade900,
//             // color: Colors.indigo.shade900,
//             color: Colors.lightBlueAccent,
//             // color: Colors.lightBlue.shade900,
//           ),
//         ),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.lightBlueAccent,
//               ),
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     // backgroundImage: AssetImage('assets/images/Samosa.jpg'),
//                     backgroundColor: Colors.white54,
//                     child: Icon(
//                       Icons.account_circle_rounded,
//                       color: Colors.white60,
//                       size: 60,
//                     ),
//                   ),
//                   SizedBox(width: 20),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                           child: Text('Name',
//                               style: TextStyle(
//                                   fontSize: 25,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.lightBlue.shade900))),
//                       Container(
//                           child: Text('Username: ',
//                               style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w200,
//                                   color: Colors.lightBlue.shade900,
//                                   fontStyle: FontStyle.italic))),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             ListTile(
//               title: Text('User'),
//               onTap: () {
//                 // Handle item 1 tap
//               },
//             ),
//             ListTile(
//               title: Text('Settings'),
//               onTap: () {
//                 // Handle item 2 tap
//               },
//             ),
//             ListTile(
//               title: Text('Logout'),
//               onTap: () {
//                 // Handle item 2 tap
//               },
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             buildGrid(context, Colors.blue.shade100, Colors.blue.shade200),
//             SizedBox(height: 40),
//             Text(
//               'Previous Projects',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(height: 20),
//             buildData(context, Colors.blue.shade50, Colors.blue.shade300),
//             SizedBox(height: 20),
//             // buildGrid(context, Colors.green.shade100, Colors.green.shade200),
//             // SizedBox(height: 20),
//             // buildGrid(context, Colors.yellow.shade100, Colors.yellow.shade200),
//             // SizedBox(height: 20),
//             // buildGrid(context, Colors.purple.shade100, Colors.purple.shade200),
//             // SizedBox(height: 20),
//             // buildGrid(context, Colors.orange.shade100, Colors.orange.shade200),
//             // SizedBox(height: 20),
//             // buildGrid(context, Colors.red.shade100, Colors.red.shade200),
//             // SizedBox(height: 20),
//             // buildGrid(context, Colors.black54, Colors.black87),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildGrid(BuildContext context, colname, brcna) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: GridView.count(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         crossAxisCount: 3,
//         mainAxisSpacing: 8.0,
//         crossAxisSpacing: 8.0,
//         children: [
//           InkWell(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: colname,
//                 borderRadius: BorderRadius.all(Radius.circular(21)),
//                 border: Border.all(
//                   color: brcna,
//                   width: 1,
//                 ),
//               ),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
//                 child: Center(
//                   child: Column(
//                     children: [
//                       Icon(
//                         Icons.create_new_folder,
//                         color: Colors.white54,
//                         size: 45,
//                       ),
//                       Text(
//                         'New Project',
//                         style: TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black54,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => HtmlEditor(),
//                 ),
//               );
//             },
//           ),
//           Container(
//             decoration: BoxDecoration(
//               color: colname,
//               borderRadius: BorderRadius.all(Radius.circular(21)),
//               border: Border.all(
//                 color: brcna,
//                 width: 1,
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
//               child: Column(
//                 children: [
//                   Center(
//                     child: FaIcon(
//                       FontAwesomeIcons.folderOpen,
//                       color: Colors.white54,
//                       size: 35,
//                     ),
//                   ),
//                   Text(
//                     'Create New Project File',
//                     style: TextStyle(),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               color: colname,
//               borderRadius: BorderRadius.all(Radius.circular(21)),
//               border: Border.all(
//                 color: brcna,
//                 width: 1,
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
//               child: Column(
//                 children: [
//                   Center(
//                     child: FaIcon(
//                       FontAwesomeIcons.userNinja,
//                       color: Colors.white54,
//                       size: 35,
//                     ),
//                   ),
//                   Text(
//                     'Friends',
//                     style: TextStyle(),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: colname,
//                 borderRadius: BorderRadius.all(Radius.circular(21)),
//                 border: Border.all(
//                   color: brcna,
//                   width: 1,
//                 ),
//               ),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                 child: Center(
//                   child: Column(
//                     children: [
//                       Center(
//                         child: FaIcon(
//                           FontAwesomeIcons.html5,
//                           color: Colors.white54,
//                           size: 35,
//                         ),
//                       ),
//                       Text(
//                         'HTML Challenges',
//                         style: TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black54,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => QuizPage(),
//                 ),
//               );
//             },
//           ),
//           Container(
//             decoration: BoxDecoration(
//               color: colname,
//               borderRadius: BorderRadius.all(Radius.circular(21)),
//               border: Border.all(
//                 color: brcna,
//                 width: 1,
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//               child: Column(
//                 children: [
//                   Center(
//                     child: FaIcon(
//                       FontAwesomeIcons.css3,
//                       color: Colors.white54,
//                       size: 35,
//                     ),
//                   ),
//                   Center(
//                     child: Text(
//                       'CSS Challenges',
//                       style: TextStyle(),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               color: colname,
//               borderRadius: BorderRadius.all(Radius.circular(21)),
//               border: Border.all(
//                 color: brcna,
//                 width: 1,
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//               child: Column(
//                 children: [
//                   Center(
//                     child: FaIcon(
//                       FontAwesomeIcons.js,
//                       color: Colors.white54,
//                       size: 35,
//                     ),
//                   ),
//                   Center(
//                     child: Text(
//                       'JS Challenges',
//                       style: TextStyle(),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildData(BuildContext context, colname, brcna) {
//     return Center(
//       child: SizedBox(
//         width: 400,
//         // height: 00,
//         child: Center(
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.cyan.shade100,
//                   // color: colname,
//                   borderRadius: BorderRadius.all(Radius.circular(21)),
//                   border: Border.all(
//                     color: Colors.cyan.shade200,
//                     width: 1.5,
//                   ),
//                 ),
//                 width: 300,
//                 height: 300,
//                 // color: Colors.black,
//                 padding: EdgeInsets.all(15.0),
//                 alignment: Alignment.bottomLeft,
//                 child: Text(
//                   'Project Details(Name lastedited accessed by etc)',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black54,
//                   ),
//                 ), //Text
//                 // child: Text(
//                 //   'Project Code',
//                 //   style: TextStyle(
//                 //     fontSize: 13,
//                 //     fontWeight: FontWeight.bold,
//                 //     color: Colors.black54,
//                 //   ),
//                 // ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white70,
//                   borderRadius: BorderRadius.all(Radius.circular(21)),
//                   border: Border(
//                       bottom: BorderSide(
//                     width: 1.8,
//                     color: Colors.grey.shade300,
//                   )),
//                 ),
//                 // color: Colors.red,
//                 width: 300,
//                 height: 150,
//                 child: Text('Project Code'),
//                 // color: Colors.black,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
