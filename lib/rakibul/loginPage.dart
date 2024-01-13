
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';



class loginPage extends StatefulWidget {
  @override

  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  var fullNameInput = TextEditingController();

  var passwordInput = TextEditingController();

  void snackBarMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
  void login() async {
    String userFullName = fullNameInput.text.toString().trim();
    String userPassword = passwordInput.text.toString().trim();

    print("email: $userFullName");
    print("pass: $userPassword");

    if (userFullName == "" || userPassword == "") {
      snackBarMessage(context, 'Please input email and password.');
      return;
    }
    else{
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: userFullName, password: userPassword);
        if(userCredential.user != null){
          print(" ");print(" ");print(" ");
          print("going to sadik's page");
          print(" ");print(" ");print(" ");
          Navigator.pushNamed(context, '/homePage');
        }
      } on FirebaseAuthException catch (ex) {
        print(ex.code.toString());
      }
    }
  }


  int _proceed(BuildContext context) {
    if (fullNameInput.text.isEmpty) {
      snackBarMessage(context, 'Enter your Email or handle');
      return 21;
    }
    if (passwordInput.text.isEmpty) {
      snackBarMessage(context, 'Input Password');
      return 12;
    }

    String userFullName = fullNameInput.text;
    String userPassword = passwordInput.text;

    print("userName: $userFullName");
    print("pass: $userPassword");

    return 66;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.red.shade900,
                  Colors.red.shade800,
                  Colors.red.shade400
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeInUp(duration: Duration(milliseconds: 1000), child: Text("SignUp & get", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'oldschool'),)),
                      SizedBox(height: 10,),
                      FadeInUp(duration: Duration(milliseconds: 1300), child: Text("100 Points", style: TextStyle(color: Colors.white, fontSize: 40, fontFamily: 'oldschool',fontWeight: FontWeight.w400),)),
                    ],
                  ),
                  Image.asset("assets/images/bg.png", height: 120 , width:120 ,),
                ],

              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20,5,20,5),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 60,),
                      FadeInUp(duration: Duration(milliseconds: 1400), child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10)
                            )]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                ),
                                child: TextField(
                                  controller: fullNameInput,
                                  decoration: InputDecoration(
                                    hintText: "Email or Phone number",
                                    hintStyle: TextStyle(color: Colors.grey,fontFamily: 'oldschool'),
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.email), // Use Icons.phone for a phone icon
                                  ),
                                )
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                              ),
                              child: TextField(
                                controller: passwordInput,
                                obscureText: true,
                                obscuringCharacter: '*',
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey,fontFamily: 'oldschool',),
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.lock)
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),




                      SizedBox(height: 40,),
                      FadeInUp(duration: Duration(milliseconds: 1600), child: Container(
                        width: 120,
                        child: MaterialButton(
                          onPressed: () {
                            login();

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
                            child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'oldschool',),),
                          ),
                        ),
                      )),
                      SizedBox(height: 20,),

                      SizedBox(height: 20),
                      FadeInUp(duration: Duration(milliseconds: 1500),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signUpPage');
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF900000),
                              fontFamily: 'oldschool',
                            ),
                          ),
                        ),

                      ),
                      SizedBox(height: 10,),
                      FadeInUp(duration: Duration(milliseconds: 1700), child: Text("Continue with social media", style: TextStyle(color: Colors.grey,fontFamily: 'oldschool',),)),
                      SizedBox(height: 30,),
                      Row(
                        children: <Widget>[

                          SizedBox(width: 30,),
                          Expanded(
                            child: FadeInUp(duration: Duration(milliseconds: 1900), child: MaterialButton(
                              onPressed: () {},
                              height: 30,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),

                              ),

                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Image.asset('assets/icons/google.png',height:50 ,width:50 ,),
                                  style: ElevatedButton.styleFrom(

                                  ),
                                ),

                              )),
                          )
                          ), ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}