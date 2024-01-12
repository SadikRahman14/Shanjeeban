import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';


class noDonor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.blueGrey.shade800,
                  Colors.blueGrey.shade600,
                  Colors.blueGrey.shade400,

                ]
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 10,),
              FadeInUp(duration: Duration(milliseconds: 1000),child: Image.asset("assets/images/bg.png", height: 200 , width:200 ,)),
              FadeInUp(duration: Duration(milliseconds: 1000),child: Text('Rakibul', style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'oldschool'),)),
              SizedBox(height: 30,),
              FadeInUp(duration: Duration(milliseconds: 1300),
                child: Container(
                  alignment: Alignment.center,
                  height: 400,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Color(0xFFD4E3E1),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [BoxShadow(
                          color: Colors.red.shade500.withOpacity(0.5),
                          blurRadius: 20,
                          offset: Offset(0, 10)
                      )]
                  ),
                  child: FadeInUp(duration: Duration(milliseconds:2000),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center, // Add this line to center-align vertically

                      children: [
                        Text(
                          'NOTICE',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 50,
                            fontFamily: 'oldschool',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            'Sorry, ',
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'oldschool',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            'No Match Found For',
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'oldschool',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            'You',
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'oldschool',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            'We Are Putting You',
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'oldschool',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            'In The Waiting List',
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'oldschool',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                  ),

                ),
              ),
              SizedBox(height: 40,),
              FadeInUp(duration: Duration(milliseconds: 1600),
                child: Container(
                  width: 150,
                  child: MaterialButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/homePage');


                    },

                    height: 50,
                    // margin: EdgeInsets.symmetric(horizontal: 50),
                    color: Colors.red[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),

                    ),
                    // decoration: BoxDecoration(
                    // ),
                    child: Center(
                      child: Text("HOME", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'oldschool',),),
                    ),
                  ),

                ),
              )
            ],
          ),
        )
    ) ;
  }
}