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
import 'package:login/pages/splashScreen.dart';
import 'package:login/rakibul/noDonor.dart';
import 'package:login/pages/RequestForBlood/requestPage.dart';
import 'package:login/pages/DonateNow/recieversList.dart';
import 'package:login/pages/RequestForBlood/donatorsList.dart';
import 'package:login/pages/RequestForBlood/profilePageDonators.dart';
import 'package:login/pages/DonateNow/climaxPageReciever.dart';
import 'package:login/Usable Clasees.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  /*Future passwordReset() async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: )
  }*/
  @override
  Widget build(BuildContext context) {

    final emailcontroller = TextEditingController();
    final auth = FirebaseAuth.instance;
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade400,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 400,
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.deepPurple.shade500,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    hintText: 'Give E-mail to set new Password',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                    ),


                  ),
                ),
              ),
              CustomElevated(backgroundColor: Colors.red.shade800,
                  borderRadius: 25,
                  onPress: () {
                    auth.sendPasswordResetEmail(email: emailcontroller.text.toString())
                        .then((value) {
                            Utils().toastMessage("Supp");
                    }).onError((error, stackTrace){
                      Utils().toastMessage(error.toString());
                    });
                  },
                  title: "Send",
                  textColor: Colors.white,
                  fontFamily: 'Classy',
                  fontWeight: FontWeight.normal,
                  elevation: 2
              )

            ],
          ),
        ),
      ),
    );
  }
}
class Utils {
  void toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}