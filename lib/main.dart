import 'package:flutter/material.dart';
import 'Smj/Physical_Informtion.dart';
import 'deGea/signUpInfo.dart';
import 'rakibul/loginPage.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),

      routes: {
        '/loginPage':(context) => LoginPage(),
        '/signUpPage':(context) => signUpInfo(),
        '/homePage':(context) => Home(),
        '/physical':(context) => PhysicalInformationPage(),
      },

    );
  }
}














