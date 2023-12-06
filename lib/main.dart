import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(

      title: 'Product App',
      theme : ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Greetings Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       // Hi Khairul
                       Text(
                           'Hi Khairul',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,

                            ),
                       ),
                       // Date
                       Text(
                         '10 December, 2023',
                         style: TextStyle(
                           color: Colors.black,
                         ),

                       )
                     ],
                   ),
               //Notifications
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.all(4),
                  child: Icon(
                      Icons.notifications,
                      color: Colors.black87,
                  ),
                ),

              ],
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),

              ),
              // Base Container
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(12),
                height: 200, width: 400,
                decoration: BoxDecoration(
                  color: Colors.indigo[400],
                  borderRadius: BorderRadius.circular(16),
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Code to execute when the first button is pressed
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.brown[900]),
                      fixedSize: MaterialStateProperty.all(Size(300, 80)),
                    ),
                    child: Text(
                        'DONATE NOW',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                    ),

                  ),
                  SizedBox(height: 16), // Adding some space between buttons
                  ElevatedButton(

                    onPressed: () {
                      // Code to execute when the first button is pressed
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.brown[900]),
                      fixedSize: MaterialStateProperty.all(Size(300, 80)),
                    ),
                    child: Text(
                      'REQUEST FOR BLOOD',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),

              ),
              SizedBox(height: 30),
              // 3 Clickable Images.
              Container(
                height: 100,

                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Container(
                          child: buildImageButton('assets/profile.png', 'Help the Cause'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Container(
                        child: buildImageButton('assets/profile.png', 'Profile'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Container(
                        child: buildImageButton('assets/profile.png', 'Leaderboard'),
                      ),
                    ),
                   /* Container(
                      height: 50, width: 50,
                      decoration: BoxDecoration(

                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)
                      ),



                      child: InkWell(
                      onTap: () {
                       print('Profile Button tapped!');
                      },
                      child: Image.network(
                        'assets/profile.png', // Replace with your image asset path
                        width: 100.0, // Set the width of the image
                        height: 100.0, // Set the height of the image
                      ),
                    ),

                    ),
                    Container(
                      height: 50, width: 50,
                      decoration: BoxDecoration(

                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)
                      ),



                      child : buildImageButton('assets/profile.png', 'Profile'),

                    ),

                    Container(
                      height: 50, width: 50,
                      decoration: BoxDecoration(

                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)
                      ),



                      child: InkWell(
                        onTap: () {
                          print('Profile Button tapped!');
                        },
                        child: Image.asset(
                          'assets/profile.png',
                          width: 100.0,
                          height: 100.0,
                        ),
                      ),

                    ),*/
                  ],
              ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
Widget buildImageButton(String imagePath, String buttonText) {
  return Column(

    children: [

      Container(

        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: InkWell(
          onTap: () {
            print('$buttonText Button tapped!');
          },
          child: Image.asset(
            imagePath,
            width: 50.0,
            height: 50.0,
          ),
        ),
      ),
      SizedBox(height: 4), // Adjust the spacing between image and text
      Text(
          buttonText,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ],
  );
}