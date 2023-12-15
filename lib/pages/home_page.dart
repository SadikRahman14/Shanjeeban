import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Container(
             height: 450, width: 500,
             decoration: BoxDecoration(

               color: Colors.red[800],
               borderRadius: BorderRadius.circular(25),


             ),
             padding: EdgeInsets.only(top: 120),

             child: Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   crossAxisAlignment: CrossAxisAlignment.start,

                   children: [

                     Text(
                       'BLOOD \nTYPE',
                       style: TextStyle(
                         color: Colors.white,
                         fontFamily: 'Elegant',
                       ),
                     ),
                     Container(
                       height: 40,
                       child: const VerticalDivider(

                         color: Colors.yellow,
                         width: 10,
                       ),
                     ),
                     Text(
                       'UNIT \nDONATED',
                       style: TextStyle(
                         color: Colors.white,
                         fontFamily: 'Elegant',
                       ),
                     ),
                     Container(
                       height: 40,
                       child: const VerticalDivider(

                         color: Colors.yellow,
                         width: 10,
                       ),
                     ),
                     Text(
                       'NEXT \nDONATOIN',
                       style: TextStyle(
                         color: Colors.white,
                         fontFamily: 'Elegant',
                       ),
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
                           //textAlign: TextAlign.left, // Align text to the left
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
                           'assets/leaderboard.png', // Replace with your image asset path
                           height: 30,
                         ),
                         SizedBox(height: 8), // Add some spacing between the image and text
                         Text(
                           'Emergency',
                           style: TextStyle(
                             fontSize: 12,
                             color: Colors.black,
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
                           'assets/leaderboard.png', // Replace with your image asset path
                           height: 30,
                         ),
                         SizedBox(height: 8), // Add some spacing between the image and text
                         Text(
                           'Emergency',
                           style: TextStyle(
                             fontSize: 12,
                             color: Colors.black,
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
                           'assets/leaderboard.png', // Replace with your image asset path
                           height: 30,
                         ),
                         SizedBox(height: 8), // Add some spacing between the image and text
                         Text(
                           'Emergency',
                           style: TextStyle(
                             fontSize: 12,
                             color: Colors.black,
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
                           'assets/leaderboard.png', // Replace with your image asset path
                           height: 30,
                         ),
                         SizedBox(height: 8), // Add some spacing between the image and text
                         Text(
                           'Emergency',
                           style: TextStyle(
                             fontSize: 12,
                             color: Colors.black,
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
                           'assets/leaderboard.png', // Replace with your image asset path
                           height: 30,
                         ),
                         SizedBox(height: 8), // Add some spacing between the image and text
                         Text(
                           'Emergency',
                           style: TextStyle(
                             fontSize: 12,
                             color: Colors.black,
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
                           'assets/leaderboard.png', // Replace with your image asset path
                           height: 30,
                         ),
                         SizedBox(height: 8), // Add some spacing between the image and text
                         Text(
                           'Emergency',
                           style: TextStyle(
                             fontSize: 12,
                             color: Colors.black,
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
                ],
             ),
           ),
           Container(
             height: 20,
             decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(30),
                   topRight: Radius.circular(30),
                 )
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 IconButton(
                     onPressed: (){
                     },
                     icon: Icon(Icons.add)
                 )
               ],
             ),

           ),
          ],

       ),

     );
  }
}
