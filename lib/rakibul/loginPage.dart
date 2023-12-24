import 'package:flutter/material.dart';
import '';

class LoginPage extends StatelessWidget {
  var fullNameInput = TextEditingController();
  var passwordInput = TextEditingController();

  void snackBarMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _proceed(BuildContext context) {
    if (fullNameInput.text.isEmpty ) {
      snackBarMessage(context, 'Enter your Email or handle');
      return;

    }
    if (passwordInput.text.isEmpty) {
      snackBarMessage(context, 'Input Password');
      return;

    }

    String userFullName = fullNameInput.text;
    String userPassword = passwordInput.text;

    print("userName: $userFullName");
    print("pass: $userPassword");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff000050),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 100),
            Loginheader(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff000050),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 5),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[200]!),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.email, // Choose the icon you want (e.g., Icons.email for email)
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: TextField(
                                      controller: fullNameInput,
                                      decoration: InputDecoration(
                                        hintText: "Enter Your Email or Handle",
                                        hintStyle: TextStyle(color: Colors.black),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[200]!),
                                ),
                              ),
                              child: Row(

                                children: [
                                  Icon(
                                    Icons.lock, // Choose the icon you want (e.g., Icons.lock for password)
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: TextField(
                                      controller: passwordInput,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: "Enter your Password",
                                        hintStyle: TextStyle(color: Colors.black),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Button(onPressed: () {
                        _proceed(context);
                      }),
                      SizedBox(height: 5),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signUpPage');
                        },
                        child: Text(
                          'New to Shanjeeban?    SIGN UP',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          // Add your forgot password logic here
                        },
                        child: Text(
                          'Forgot Password? ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Loginheader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: Column(

                  children: [
                    Text(
                      "Sign Up and Get",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'oldschool ',

                      ),
                    ),
                    Text(
                      "100 Points",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.red,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'oldschool',
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/bg.png",
                  width: 120, height:120 ,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  final VoidCallback onPressed;

  const Button({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: Container(
          height: 60,
          width: 200,

          margin: EdgeInsets.symmetric(horizontal: 125),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: ElevatedButton(
            child: Text(
              'Login',
              style: TextStyle(fontSize: 18),
            ),
            onPressed: (){
              if(true)    // eikhane pore database theke info khujbo.
                Navigator.pushNamed(context, '/homePage');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
