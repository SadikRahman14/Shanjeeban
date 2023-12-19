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
      return 'enter proper email';
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

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 65,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: _validateName,
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: _validatePassword,
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: _validatePhone,
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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
    );
  }
}
