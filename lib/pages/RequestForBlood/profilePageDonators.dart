import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login/deGea/signUpInfo.dart';
import 'package:login/rakibul/loginPage.dart';
import 'package:login/pages/fromNavigationBar/NotificationPage.dart';
import 'package:login/pages/fromNavigationBar/historyPage.dart';

class DonatorsProfile extends StatefulWidget {
  const DonatorsProfile({super.key});

  @override
  State<DonatorsProfile> createState() => _DonatorsProfileState();
}

class _DonatorsProfileState extends State<DonatorsProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD4E3E1),
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            //Navigator.pushNamed(context, )
          },
          icon: Icon(LineAwesomeIcons.angle_left),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFADC4C1),
        title: Text("Donor's Profile"),
      ),
      body: SafeArea(

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                padding: EdgeInsets.only(
                  left: 20, top: 20, right: 20, bottom: 20,
                ),
                height: 530, width: 300,
                decoration: BoxDecoration(
                  color: Color(0xFFADD1CD),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(

                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFFADC4C1),
                      ),
                      child: ClipOval(
                        child: Image(

                          image: AssetImage(
                            'assetsSadik/Profile.jpg',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Khairul Islam',
                      style: TextStyle(
                        color: Color(0xFF900000),
                        fontFamily: 'Classy',
                        fontSize: 30,
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Age: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Classy',
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '32',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Classy',
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Blood Group: ',
                          style: TextStyle(
                            color: Colors.red[900],
                            fontFamily: 'Classy',
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'A+',
                          style: TextStyle(
                            color: Colors.red[900],
                            fontFamily: 'Classy',
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 200,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Last Donation: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Classy',
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '22.11.2023',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Classy',
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10,),
                    Container(
                      width: 200,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      //width: 400,
                      decoration: BoxDecoration(

                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 20,
                                color: Colors.red[900],
                              ),
                              SizedBox(width: 4), // Add spacing between the icon and text
                              Flexible(
                                child: Text(
                                  '353/17 Hatirjheel Link Road, Mogbazar',
                                  softWrap: true,
                                  overflow: TextOverflow.clip, // Change to ellipsis if you want an ellipsis (...) when text overflows
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Classy',
                                    color: Colors.red[900],
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),

                    SizedBox(height: 10,),
                    Container(
                      //width: 400,
                      decoration: BoxDecoration(

                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 20, width: 20,
                                decoration: BoxDecoration(
                                  color: Colors.grey[500],
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Icons.phone,
                                  size: 15,
                                  color: Colors.red[900],
                                ),
                              ),
                              SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  '01862937424',
                                  softWrap: true,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Classy',
                                    color: Colors.red[900],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 35,),
                          Center(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF900000)),
                                elevation: MaterialStateProperty.all<double>(10.0),
                                shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                              ),
                              onPressed: (){},
                              child: Text(
                                'REQUEST DDONATOR',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Classy',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
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