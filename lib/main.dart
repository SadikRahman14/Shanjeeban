import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shanjeeban',
      home: ProductDetailsPage(),
    );
  }
}

class ProductDetailsPage extends StatefulWidget {
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>{
  var fullNameInput = TextEditingController();
  var passwordInput = TextEditingController();
  var phoneNumberInput = TextEditingController();
  var handleInput = TextEditingController();
  var emailInput = TextEditingController();
  DateTime? selectedDate;
  var districtInput = TextEditingController();
  var thanaInput = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>() ;

  void _proceed(){
    if(_formKey.currentState!.validate()){
      String userFullName = fullNameInput.text.toString();
      String userPassword = passwordInput.text.toString();
      String userPhoneNumber = phoneNumberInput.text.toString();
      String userEmail = emailInput.text.toString();
      String userHandle = handleInput.text.toString();

      print("userName: $userFullName");
      print("pass: $userPassword");
      print("phone: $userPhoneNumber");
      print("email: $userEmail");
      print("handle: $userHandle");
    }
  }
  String? _validateName(value){
    if (value!.isEmpty)
      return 'enter proper name';
    RegExp nameReg = RegExp(r'^[a-zA-Z ]+$');
    if(!nameReg.hasMatch(value)){
      return 'enter proper name';
    }
    return null;
  }
  String? _validateEmail(value){
    if (value!.isEmpty)
      return 'enter proper email';
    RegExp emailReg = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if(!emailReg.hasMatch(value)){
      return 'enter proper email';
    }
    return null;
  }
  String? _validatePhone(value){
    if (value!.isEmpty)
      return 'enter proper number';
    RegExp phoneReg = RegExp(r'^[0-9]');
    if(!phoneReg.hasMatch(value)){
      return 'enter proper number';
    }
    if(value.length != 11)
      return 'enter proper number';
    return null;
  }
  String? _validatePassword(value){
    if (value!.isEmpty)
      return 'password must be 8 characters or longer';
    if(value.length <= 7)
      return 'password must be 8 characters or longer';
    return null;
  }
  String? _validateHandle(value){
    if (value!.isEmpty)
      return 'cant be empty';
    return null;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 65,),
                    TextFormField(
                      controller: fullNameInput,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_box),
                        labelText: 'Full Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.blue.shade700,
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.5,
                          ),
                        ),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      validator: _validateName,
                    ),
                    SizedBox(height: 15,),

                    SizedBox(height: 15,),
                    TextFormField(
                      controller: passwordInput,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_box),
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.blue.shade700,
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.5,
                          ),
                        ),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      validator: _validatePassword,
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: handleInput,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_box),
                        labelText: 'Handle',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.blue.shade700,
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.5,
                          ),
                        ),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      validator: _validateHandle,
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: phoneNumberInput,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_box),
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.blue.shade700,
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.5,
                          ),
                        ),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      validator: _validatePhone,
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: emailInput,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_box),
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.blue.shade700,
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.5,
                          ),
                        ),
                        errorStyle: TextStyle(color: Colors.blueGrey),
                      ),
                      validator: _validateEmail,
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _proceed,
              child: Text('Proceed to Physical Info'),
            )
          ],
        ),
      ),
    );
  }
}
