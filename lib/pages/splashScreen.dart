import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login/deGea/signUpInfo.dart';
import 'package:login/mainPage.dart';
import 'package:login/rakibul/loginPage.dart';
import 'package:login/pages/fromNavigationBar/NotificationPage.dart';
import 'package:login/pages/fromNavigationBar/historyPage.dart';
import 'package:login/Usable%20Clasees.dart';
import 'package:flutter/services.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:login/pages/base.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{



  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Color(0xFF40274D),
      splash: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assetsSadik/base002.png',
                height: 300,
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomElevated(backgroundColor: Colors.black,
                      borderRadius: 0,
                      onPress: (){},
                      title: 'SIGN UP',
                      textColor: Colors.white,
                      fontFamily: 'Classy',
                      fontWeight: FontWeight.bold,
                      elevation: 2
                  ),
                  SizedBox(width: 20,),
                  CustomElevated(backgroundColor: Colors.amber.shade800,
                      borderRadius: 0,
                      onPress: (){},
                      title: 'LOG IN',
                      textColor: Colors.white,
                      fontFamily: 'Classy',
                      fontWeight: FontWeight.bold,
                      elevation: 2
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
      nextScreen: BaseScreen(),
      splashIconSize: 700,
      duration: 6000,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
