import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login/deGea/signUpInfo.dart';
import 'package:login/rakibul/loginPage.dart';
import 'package:login/pages/fromNavigationBar/NotificationPage.dart';
import 'package:login/pages/fromNavigationBar/historyPage.dart';
import 'package:url_launcher/url_launcher.dart';

class Distribution extends StatefulWidget {
  const Distribution({super.key});

  @override
  State<Distribution> createState() => _DistributionState();
}

class _DistributionState extends State<Distribution> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(LineAwesomeIcons.angle_left),
        ),
        centerTitle: true,
        title: Text(
            'Points Distribution',
          style: TextStyle(
            fontFamily: 'Classy',
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(12),
          height: 400,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.red.shade200,
          ),
          child: Center( // Wrap Column with Center widget
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BulletText(text: '100 Points for Sign Up'),
                BulletText(text: '400 Points in First Blood Donation'),
                BulletText(text: '250 Points for Every Blood Donation'),
                BulletText(text: 'Gain 100 Points for Introducing a Friend'),
                BulletText(text: '3 Yearly Donation  : 500 Points'),
                BulletText(text: 'Gift for Birthday : 100 points'),
              ],
            ),
          ),
        ),
      )
    );
   }
}

class BulletText extends StatelessWidget {
  final String text;

  BulletText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      textBaseline: TextBaseline.alphabetic,
      children: [
        Container(
          child: Text(
            '\u25CB',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Classy',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
