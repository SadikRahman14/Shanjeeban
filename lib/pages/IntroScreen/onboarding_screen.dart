import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login/deGea/signUpInfo.dart';
import 'package:login/pages/IntroScreen/IntroPageOne.dart';
import 'package:login/pages/IntroScreen/IntroPageThree.dart';
import 'package:login/pages/IntroScreen/IntroPageTwo.dart';
import 'package:login/rakibul/loginPage.dart';
import 'package:login/pages/fromNavigationBar/NotificationPage.dart';
import 'package:login/pages/fromNavigationBar/historyPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:login/Usable Clasees.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  PageController _controller = PageController();
  bool inlastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index){
              setState(() {
                inlastPage = (index == 2);
              });
            },
            children: [
              IntroPageOne(),
              IntroPageTwo(),
              IntroPageThree()
            ],
          ),
          Container(
            alignment: Alignment(0,0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomElevated(
                      backgroundColor: Color(0xBEBED565),onPress: (){
                    Navigator.pushNamed(
                      context, '/loginPage',
                    );
                  },
                      borderRadius: 25.0,

                      title: 'SKIP',
                      textColor: Colors.white,
                      fontFamily: 'Classy',
                      fontWeight: FontWeight.bold,
                      elevation: 2
                  ),
                  SmoothPageIndicator(controller: _controller, count: 3,),
                  inlastPage?
                  CustomElevated(
                      backgroundColor: Colors.red.shade800,
                      borderRadius: 25.0,
                      onPress: (){
                        Navigator.pushNamed(
                          context, '/loginPage',
                        );
                      },
                      title: 'DONE',
                      textColor: Colors.white,
                      fontFamily: 'Classy',
                      fontWeight: FontWeight.bold,
                      elevation: 2
                  ):
                  CustomElevated(
                      backgroundColor: Color(0x650805FF),
                      borderRadius: 25.0,
                      onPress: (){
                        _controller.nextPage(duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      title: 'NEXT',
                      textColor: Colors.white,
                      fontFamily: 'Classy',
                      fontWeight: FontWeight.bold,
                      elevation: 2
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}
