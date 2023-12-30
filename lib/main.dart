import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/firebase_options.dart';
import 'Smj/Physical_Informtion.dart';
import 'deGea/signUpInfo.dart';
import 'rakibul/loginPage.dart';
import 'pages/home_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  //
  // Map <String, dynamic> newUser = {
  //   "age": 23,
  //   "email" : "a@b.com"
  // };
  // await _fireStore.collection("userInfo").add(newUser);
  // print(" ");
  // print("user info added.");
  // print(" ");

  runApp(MyApp());
}

// FirebaseFirestore _firestore = FirebaseFirestore.instance;

// DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection("users").doc("Z3kfNrbsVBlgqPnP94S2").get();
// log(snapshot.data().toString());

// Map<String, dynamic> newUserData = {
//   "name": "SlantCode",
//   "email": "slantcode@gmail.com"
// };
// await _firestore.collection("users").doc("your-id-here").update({              //update profile
//   "email": "slantcode2@gmail.com"
// });
// log("User updated!");

// await _firestore.collection("users").doc("Z3kfNrbsVBlgqPnP94S2").delete();    // delete profile
// log("User deleted!");

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser != null) ? Home() : loginPage(),
      routes: {
        '/loginPage':(context) => loginPage(),
        '/signUpPage':(context) => signUpInfo(),
        '/homePage':(context) => Home(),
        '/physical':(context) => PhysicalInformationPage(),
      },
    );
  }
}




