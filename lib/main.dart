import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/firebase_options.dart';
import 'package:login/mainPage.dart';
import 'package:login/pages/base.dart';
import 'package:login/pages/splashScreen.dart';
import 'package:login/rakibul/noDonor.dart';
import 'package:login/pages/DonateNow/profileNeedsBlood.dart';
import 'package:login/pages/RequestForBlood/requestPage.dart';
import 'Smj/Physical_Informtion.dart';
import 'deGea/signUpInfo.dart';
import 'rakibul/loginPage.dart';
import 'pages/fromNavigationBar/home_page.dart';
import 'pages/profilePage.dart';
import 'package:login/pages/DonateNow/donateNow.dart';
import 'package:login/pages/RequestForBlood/donatorsList.dart';
import 'package:login/pages/RequestForBlood/profilePageDonators.dart';
import 'package:login/pages/DonateNow/climaxPage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      home: SplashScreen(),//(FirebaseAuth.instance.currentUser != null) ? Home() : loginPage(),

      routes: {
        '/mainPage':(context) => MainPage(),
        '/loginPage':(context) => loginPage(),
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




