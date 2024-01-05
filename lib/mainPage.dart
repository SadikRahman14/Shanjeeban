import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login/deGea/signUpInfo.dart';
import 'package:login/rakibul/loginPage.dart';
import 'package:login/pages/fromNavigationBar/NotificationPage.dart';
import 'package:login/pages/fromNavigationBar/historyPage.dart';
import 'package:login/pages/fromNavigationBar/friendsPage.dart';
import 'package:login/pages/fromNavigationBar/home_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override

  State<MainPage> createState() => _MainPageState();


}

class _MainPageState extends State<MainPage> {
  @override
  int _currentIndex = 0;
  final List<Widget> screens = [
    Home(),
    NotificatoinPage(),
    HostoryPage(),
    FriendsPage(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(

        backgroundColor: Colors.white,

        color: Color(0xFF900000),
        animationDuration: const Duration(milliseconds: 400),
        height: 50,
        items: [
          FaIcon(

            Icons.house,
            color: Colors.white,
          ),
          FaIcon(
            Icons.search,
            color: Colors.white,
          ),
          Icon(
            LineAwesomeIcons.medal,
            color: Colors.white,
          ),
          Icon(
            LineAwesomeIcons.user_friends,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

      ),
    );
  }
}
