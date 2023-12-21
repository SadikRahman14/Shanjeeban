import 'package:flutter/material.dart';
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
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
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
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[200]!),
                                ),
                              ),
                              child: TextField(
                                controller: fullNameInput,
                                decoration: InputDecoration(
                                  hintText: "Enter Your Email or Handle",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[200]!),
                                ),
                              ),
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
                      SizedBox(height: 5),
                      Button(onPressed: () {
                        _proceed(context);
                      }),
                      SizedBox(height: 5),
                      TextButton(
                        onPressed: () {},
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Column(
                children: [
                  Text(
                    "Sign Up and Get",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'oldschool',

                    ),
                  ),
                  Text(
                    "100 Points",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.red,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'oldschool',
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Image.asset("assets/images/bg.png",
               width: 150, height:150 ,
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
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 100.0),
        child: Container(
          height: 50,
          width: 200,
          margin: EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(150),
          ),
          child: ElevatedButton(
            child: Text(
              'Login',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
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
