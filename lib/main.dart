import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/firebase_options.dart';
import 'package:login/mainPage.dart';
import 'package:login/pages/ChatRoom.dart';
import 'package:login/pages/Emergency.dart';
import 'package:login/pages/base.dart';

import 'package:login/pages/leaderboard/LeaderboardUI.dart';
import 'package:login/pages/IntroScreen/onboarding_screen.dart';

import 'package:login/pages/requestorProfile.dart';

import 'package:login/pages/splashScreen.dart';
import 'package:login/rakibul/noDonor.dart';
import 'package:login/pages/DonateNow/profilePageReciever.dart';
import 'package:login/pages/RequestForBlood/requestPage.dart';
import 'Smj/Physical_Informtion.dart';
import 'deGea/signUpInfo.dart';
import 'rakibul/loginPage.dart';
import 'pages/fromNavigationBar/home_page.dart';
import 'pages/profilePage.dart';
import 'package:login/pages/DonateNow/recieversList.dart';
import 'package:login/pages/RequestForBlood/donatorsList.dart';
import 'package:login/pages/RequestForBlood/profilePageDonators.dart';
import 'package:login/pages/DonateNow/climaxPageReciever.dart';
import 'package:login/pages/DonateNow/requestorList.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  User? currentUser = FirebaseAuth.instance.currentUser;
  if(currentUser != null){
    runApp(MyApp());
  }
  else{
    runApp(toLogin());
  }
}


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,


      home: RequestorList(), //MainPage(),//(FirebaseAuth.instance.currentUser != null) ? Home() : loginPage(),


      routes: {
        '/mainPage':(context) => MainPage(),
        '/loginPage':(context) => loginPage(),
        '/signUpPage':(context) => signUpInfo(),
        '/homePage':(context) => Home(),
        '/physical':(context) => PhysicalInformationPage(),
        '/userProfile':(context) => Profile(),
        '/donatorsProfile':(context) => DonatorsProfile(),
        '/requestedProfile':(context) => RequestedProfile(),
        '/donatorsList':(context) => DonatorsListPage(),
        '/recieversList':(context) => DonateNow(),
        '/requestForm' : (context) => BloodRequestForm(),
        '/allRequests' : (context) => RequestorList(),
        '/requestorProfile' : (context) => RequestorProfile(),
      },
    );
  }
}


class toLogin extends StatefulWidget {
  const toLogin({super.key});

  @override
  State<toLogin> createState() => _toLoginState();
}

class _toLoginState extends State<toLogin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: loginPage(), //MainPage(),//(FirebaseAuth.instance.currentUser != null) ? Home() : loginPage(),

      routes: {
        '/mainPage':(context) => MainPage(),
        '/loginPage':(context) => loginPage(),
        '/signUpPage':(context) => signUpInfo(),
        '/homePage':(context) => Home(),
        '/physical':(context) => PhysicalInformationPage(),
        '/userProfile':(context) => Profile(),
        '/donatorsProfile':(context) => DonatorsProfile(),
        '/requestedProfile':(context) => RequestedProfile(),
        '/donatorsList':(context) => DonatorsListPage(),
        '/recieversList':(context) => DonateNow(),
        '/requestForm' : (context) => BloodRequestForm(),
        '/emergency' : (context) => Emergency(),

      },
    );
  }
}



