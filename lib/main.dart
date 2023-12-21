import 'package:flutter/material.dart';
import 'deGea/signUpInfo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shanjeeban',
      home: signUpInfo(),
    );
  }
}

