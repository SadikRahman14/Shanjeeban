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
  var emailInput = TextEditingController();
  var dateOfBirthInput = TextEditingController();
  var districtInput = TextEditingController();
  var thanaInput = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white, //deepPurple[900]
      // appBar: AppBar(
      //   backgroundColor: Colors.amberAccent,
      //   title: Center(child: Text('GG')),
      // ),

      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 68,),
                TextField(
                  controller: fullNameInput,
                  decoration: InputDecoration(
                    label : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.account_box,size: 24,),
                        Text(" Full Name"),
                      ],
                    ),
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'Poppins-Medium',
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
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
                    label : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.key,size: 24,),
                        Text(" Password"),
                      ],
                    ),
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'Poppins-Medium',
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
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
                    label : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.phone,size: 24,),
                        Text(" Phone Number"),
                      ],
                    ),
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'Poppins-Medium',
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
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
                    label : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.supervisor_account,size: 24,),
                        Text(" Handle"),
                      ],
                    ),
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'Poppins-Medium',
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                  ),
                ),//handle
                SizedBox(height: 18,),
                TextField(
                  controller: emailInput,
                  decoration: InputDecoration(
                    label : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.email,size: 24,),
                        Text(" Email"),
                      ],
                    ),
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'Poppins-Medium',
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                  ),
                ),//gmail
                SizedBox(height: 18,),
                TextField(
                  controller: dateOfBirthInput,
                  decoration: InputDecoration(
                    label : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.date_range_sharp,size: 24,),
                        Text(" Date of Birth"),
                      ],
                    ),
                    labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        // fontFamily: 'Poppins-Medium',
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                  ),
                ),//dateOfBirth
                SizedBox(height: 18,),
                TextField(
                  controller: districtInput,
                  decoration: InputDecoration(
                    label : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on,size: 24,),
                        Text(" District"),
                      ],
                    ),
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'Poppins-Medium',
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                  ),
                ),//district
                SizedBox(height: 18,),
                TextField(
                  controller: thanaInput,
                  decoration: InputDecoration(
                    label : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add_location,size: 24,),
                        Text(" Thana"),
                      ],
                    ),
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'Poppins-Medium',
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
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
                    String userEmail = emailInput.text.toString();
                    String userDateofBirth = dateOfBirthInput.text.toString();
                    String userDistrict = districtInput.text.toString();
                    String userThana = thanaInput.text.toString();
        
                    print(
                      "userName: $userFullName, password: $userPassword, handle: $userHandle, phone: $userPhoneNumber"
                    );
                  },
                  child: Text('Proceed to Physical Info'),
                ),
              ],
            ),
          )
        ),
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