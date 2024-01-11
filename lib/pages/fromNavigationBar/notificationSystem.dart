import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationServices{
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void requestNotificationPermission() async{
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      sound: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,

    );

    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print('Permission Granted');

    }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
      print('Provisional Permission Granted');

    }else{
      AppSettings.openAppSettings();
      print('No Permission Granted');
    }
  }
}