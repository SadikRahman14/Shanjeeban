import 'package:flutter/material.dart';

import 'Smj/Physical_Informtion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhysicalInformationPage(),
    );
  }
}






