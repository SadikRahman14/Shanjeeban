import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login/deGea/signUpInfo.dart';
import 'package:login/rakibul/loginPage.dart';
import 'package:login/pages/fromNavigationBar/NotificationPage.dart';
import 'package:login/pages/fromNavigationBar/historyPage.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade100,
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                'Join Our Thriving Community',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: 'Classy',
                ),
              ),

              Lottie.network('https://lottie.host/3c35a437-7150-4940-828d-4b8dda8586f5/fajwm80gfX.json'),

              Text(

                'Dive into a space where your voice is heard, connections flourish, \nand a sense of belonging awaits',
                textAlign: TextAlign.center,
                style: TextStyle(

                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  fontFamily: 'Classy',
                ),
              )
            ],
          ),
      ),
    );
  }
}