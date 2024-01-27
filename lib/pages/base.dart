import 'package:flutter/material.dart';
import 'package:login/Usable%20Clasees.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  bool showDelayedPart = false;

  @override
  void initState() {
    super.initState();
    // Delay the appearance of the delayed part after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        showDelayedPart = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF40274D),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assetsSadik/logo.png',
          ),
          Text(
            'Shanjeeban',
            style: TextStyle(
              color: Colors.pink.shade100,
              fontFamily: 'Classy',
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Container(
                width: 100,
                child: Divider(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Text(
            'Give the Gift of Life',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Classy',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 50),
          if (showDelayedPart) // Only show the delayed part if showDelayedPart is true
            AnimatedOpacity(
              opacity: showDelayedPart ? 1.0 : 0.0,
              duration: Duration(seconds: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomElevated(
                    backgroundColor: Colors.black,
                    borderRadius: 0,
                    onPress: () {
                      Navigator.pushNamed(context, '/signUpPage');
                    },
                    title: 'SIGN UP',
                    textColor: Colors.white,
                    fontFamily: 'Classy',
                    fontWeight: FontWeight.bold,
                    elevation: 2,
                  ),
                  SizedBox(width: 20),
                  CustomElevated(
                    backgroundColor: Colors.amber.shade800,
                    borderRadius: 0,
                    onPress: () {
                      Navigator.pushNamed(context, '/loginPage');
                    },
                    title: 'LOG IN',
                    textColor: Colors.white,
                    fontFamily: 'Classy',
                    fontWeight: FontWeight.bold,
                    elevation: 2,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

