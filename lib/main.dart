import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Shanjeeban',
      home: ProductDetailsPage(),
    );
  }
}

class ProductDetailsPage extends StatefulWidget{
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  var fullNameInput = TextEditingController();
  var passwordInput = TextEditingController();
  var phoneNumberInput = TextEditingController();
  var handleInput = TextEditingController();
  var gmailInput = TextEditingController();
  var dateOfBirthInput = TextEditingController();
  var cityInput = TextEditingController();
  var thanaInput = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white, //deepPurple[900]
      // appBar: AppBar(
      //   backgroundColor: Colors.amberAccent,
      //   title: Center(child: Text('GG')),
      // ),


      body: Center(
        child: Container(
          width: 320,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: fullNameInput,
                decoration: InputDecoration(
                  hintText: "full name",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                ),
              ),//fullName
              SizedBox(height: 18,),
              TextField(
                controller: passwordInput,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: "password",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                ),
              ),//password
              SizedBox(height: 18,),
              TextField(
                controller: phoneNumberInput,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "phone number ",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                ),
              ),//phone
              SizedBox(height: 18,),
              TextField(
                controller: handleInput,
                decoration: InputDecoration(
                  hintText: "handle",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                ),
              ),//handle
              SizedBox(height: 18,),
              TextField(
                controller: handleInput,
                decoration: InputDecoration(
                  hintText: "gmail",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                ),
              ),//gmail
              SizedBox(height: 18,),
              TextField(
                controller: handleInput,
                decoration: InputDecoration(
                  hintText: "date of birth",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                ),
              ),//dateOfBirth
              SizedBox(height: 18,),
              TextField(
                controller: handleInput,
                decoration: InputDecoration(
                  hintText: "district",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                ),
              ),//district
              SizedBox(height: 18,),
              TextField(
                controller: handleInput,
                decoration: InputDecoration(
                  hintText: "thana",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                ),
              ),//thana
              SizedBox(height: 18,),
              ElevatedButton(
                onPressed: (){
                  String userFullName = fullNameInput.text.toString();
                  String userPassword = passwordInput.text.toString();
                  String userPhoneNumber = phoneNumberInput.text.toString();
                  String userHandle = handleInput.text.toString();

                  print(
                    "userName: $userFullName, password: $userPassword, handle: $userHandle, phone: $userPhoneNumber"
                  );
                },
                child: Text('physical info'),
              ),
            ],
          ),
        )
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   //currentIndex: _currentIndex,
      //   onTap: (index) {},
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: 'Search',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: '',
      //     ),
      //   ],
      // ),
    );
  }
}