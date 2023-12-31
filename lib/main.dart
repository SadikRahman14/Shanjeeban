import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/firebase_options.dart';
import 'package:login/pages/DonateNow/profileNeedsBlood.dart';
import 'package:login/pages/RequestForBlood/requestPage.dart';
import 'Smj/Physical_Informtion.dart';
import 'deGea/signUpInfo.dart';
import 'rakibul/loginPage.dart';
import 'pages/home_page.dart';
import 'pages/profilePage.dart';
import 'package:login/pages/DonateNow/donateNow.dart';
import 'package:login/pages/RequestForBlood/donatorsList.dart';
import 'package:login/pages/RequestForBlood/profilePageDonators.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: DonatorsProfile(),


      routes: {
        '/loginPage':(context) => LoginPage(),
        '/signUpPage':(context) => signUpInfo(),
        '/homePage':(context) => Home(),
        '/physical':(context) => PhysicalInformationPage(),
        '/userProfile':(context) => Profile(),
        '/donatorsProfile':(context) => DonatorsProfile(),
        '/requestedProfile':(context) => RequestedProfile(),
        '/requestedProfile':(context) => RequestedProfile(),
        '/donatorsList':(context) => DonatorsListPage(),
        '/recieversList':(context) => DonateNow(),

      },
    );
  }
}




