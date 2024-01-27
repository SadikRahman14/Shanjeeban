import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:login/firebase_options.dart';
import 'package:login/pages/profilePage.dart';

class NotificatoinPage extends StatefulWidget {
  const NotificatoinPage({super.key});

  @override
  State<NotificatoinPage> createState() => _NotificatoinPageState();
}

class _NotificatoinPageState extends State<NotificatoinPage> {
  @override
  Widget build(BuildContext context) {
    //get the notification message and display on screen
    // final message= ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      body: Center(
        child: Text(
          'Notification Page',
          style: TextStyle(
            fontFamily: 'Classy',
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
