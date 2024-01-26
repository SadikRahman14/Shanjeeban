import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login/deGea/signUpInfo.dart';
import 'package:login/rakibul/loginPage.dart';
import 'package:login/pages/fromNavigationBar/NotificationPage.dart';
import 'package:login/pages/fromNavigationBar/historyPage.dart';
import 'package:login/Usable%20Clasees.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF40274D),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Image.asset(
               'assetsSadik/base002.png',
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
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomElevated(backgroundColor: Colors.black,
                  borderRadius: 0,
                  onPress: (){
                    showDialog(
                        context: context,
                        builder: (context){
                          return Center(child: CircularProgressIndicator());
                        }
                    );
                    Future.delayed(Duration(seconds: 1), () {
                    Navigator.pushNamed(context, '/signUpPage'
                    ).then((_) {
            Navigator.of(context).pop();
               });
               });
                  },
                  title: 'SIGN UP',
                  textColor: Colors.white,
                  fontFamily: 'Classy',
                  fontWeight: FontWeight.bold,
                  elevation: 2
              ),
              SizedBox(width: 20,),
              CustomElevated(backgroundColor: Colors.amber.shade800,
                  borderRadius: 0,
                  onPress: (){
                    showDialog(
                        context: context,
                        builder: (context){
                          return Center(child: CircularProgressIndicator());
                        }
                    );
                    Future.delayed(Duration(seconds: 1), () {
                    Navigator.pushNamed(context, '/loginPage'
                    ).then((_) {
                      Navigator.of(context).pop();
                    });
                    });
                  },
                  title: 'LOG IN',
                  textColor: Colors.white,
                  fontFamily: 'Classy',
                  fontWeight: FontWeight.bold,
                  elevation: 2
              ),
            ],
          ),

        ],
      ),
    );
  }
}
