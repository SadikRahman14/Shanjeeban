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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String ?docID  = "gg";
  String ?name;

  @override
  int _currentIndex = 0;
  final List<Widget> screens = [
    Home(),
    NotificatoinPage(),
    HostoryPage()
  ];


  Future<void> getUserData() async {
    try {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection("userCredentials").doc(docID).get();
      if (userSnapshot.exists) {
        String userName = userSnapshot['name'];
        int age = userSnapshot['age'];
        String district = userSnapshot['district'];
        String thana = userSnapshot['thana'];
        int phone = userSnapshot['number'];

        setState(() {
          name = userName;
        });

        // print('User Name: $userName');
        // print('age: $age');
        // print('User district: $district');
        // print('User thana: $thana');
        // print('User phone: $phone');
      } else {
        print('User does not exist');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic>? args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null && args.containsKey('docID')) {
      docID = args['docID'];
      getUserData();
    }
    else{
      getUserData();
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Red Container
            Container(
              height: 400, width: 500,
              decoration: BoxDecoration(

                color: Color(0xFF900000),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(26),
                  bottomRight: Radius.circular(26),
                ),


              ),
              padding: EdgeInsets.only(top: 50),

              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16,0, 16,0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Image.asset(
                            'assetsSadik/logo.png',
                            height: 40,
                          ),
                          Text(
                            '$name' ?? 'Loading...',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Profile',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,

                            ),
                          ),
                          SizedBox(width: 135,),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/userProfile',
                                  arguments: {
                                    'docID' : docID,
                                  }
                              );
                            },
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.grey[100],
                              child: ClipOval(
                                child: Image.asset(
                                  'assetsSadik/Profile.jpg',
                                  height: 40,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BLOOD \nTYPE:',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Elegant',
                            ),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              'A+',
                              style: TextStyle(
                                color: Colors.amber,
                                fontFamily: 'Elegant',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 60,
                        child: const VerticalDivider(

                          color: Colors.yellow,
                          width: 10,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'UNIT \nDONATED:',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Elegant',
                            ),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              '05',
                              style: TextStyle(
                                color: Colors.amber,
                                fontFamily: 'Elegant',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),


                      Container(
                        height: 60,
                        child: const VerticalDivider(

                          color: Colors.yellow,
                          width: 10,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NEXT \nDONATION:',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Elegant',
                            ),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              '26.01.2024',
                              style: TextStyle(
                                color: Colors.amber,
                                fontFamily: 'Elegant',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(

                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'Every  Blood  Donor',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Distorted',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 16), // Optional: Add left padding for spacing
                        child: Text(
                          'is  a  HERO',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            fontFamily: 'Distorted',

                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35,),



                ],

              ),

            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      padding: EdgeInsets.all(8), // Padding around the button content
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assetsSadik/ambulance.png', // Replace with your image asset path
                            height: 30,
                          ),
                          SizedBox(height: 8), // Add some spacing between the image and text
                          Text(
                            'Emergency',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Your Nearby Service',
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/recieversList');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      padding: EdgeInsets.all(8), // Padding around the button content
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assetsSadik/donateNow.png', // Replace with your image asset path
                            height: 30,
                          ),
                          SizedBox(height: 8), // Add some spacing between the image and text
                          Text(
                            'DONATE NOW',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Your Help Matters',
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/requestForm');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assetsSadik/request.png',
                            height: 30,
                            //width: 60,
                          ),
                          SizedBox(height: 8), // Add some spacing between the image and text
                          Text(
                            'Request Blood',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Donors Waiting!',
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      padding: EdgeInsets.all(8), // Padding around the button content
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assetsSadik/PointsIcon.png', // Replace with your image asset path
                            height: 30,
                          ),
                          SizedBox(height: 8), // Add some spacing between the image and text
                          Text(
                            '253 Points',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Claim Your Rewards!',
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      padding: EdgeInsets.all(8), // Padding around the button content
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assetsSadik/support.png', // Replace with your image asset path
                            height: 30,
                          ),
                          SizedBox(height: 8), // Add some spacing between the image and text
                          Text(
                            'Invite Friends',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Get 100 Points',
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      padding: EdgeInsets.all(8), // Padding around the button content
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assetsSadik/leaderboard.png', // Replace with your image asset path
                            height: 30,
                          ),
                          SizedBox(height: 8), // Add some spacing between the image and text
                          Text(
                            'Leaderboard',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'See the Ranking',
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),



      );
  }
}
