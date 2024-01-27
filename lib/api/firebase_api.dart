import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:login/main.dart';


class Firebase_api {
  //create an instance of Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;
  //function to initialize notifications
  Future<void> initNotifications() async {
    //request permission from use (will prompt user)
    await _firebaseMessaging.requestPermission();
    //fetch the FCM token for this device
    final fCMToken= await _firebaseMessaging.getToken();
    //print the token(normally you would send this to your server)
    print('Token:  $fCMToken');
    //initialize futher settings for push noti
    initPushNotifications();

  }
  //function to handle received messages
  void handleMessage(RemoteMessage? message){
    //if the message is null, do nothing
    if(message==null)return;
    //navigate to new screen when message is received and use taps notification
    navigatorKey.currentState?.pushNamed(
      'noReciver()',
      arguments: message,
    );

  }

  //funtion to initialize foreground and bakground settings
  Future initPushNotifications() async {
    //handle notification if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    //attach event listeners for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }





}
