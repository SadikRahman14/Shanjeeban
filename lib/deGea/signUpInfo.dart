import 'package:flutter/material.dart';

class signUpInfo extends StatefulWidget {
  @override
  State<signUpInfo> createState() => _signUpInfo();
}

class _signUpInfo extends State<signUpInfo> {
  var fullNameInput = TextEditingController();
  var passwordInput = TextEditingController();
  var phoneNumberInput = TextEditingController();
  var handleInput = TextEditingController();
  var emailInput = TextEditingController();
  DateTime? selectedDate;
  var districtInput;
  var thanaInput;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  ////////////////////////////////////////////////  VALIDATOR   ///////////////////////////////////////////////////
  String? _validateName(value) {
    if (value!.isEmpty)
      return 'Enter a valid name';
    RegExp nameReg = RegExp(r'^[a-zA-Z ]+$');
    if (!nameReg.hasMatch(value)) {
      return 'Enter a valid name';
    }
    return null;
  }
  String? _validateEmail(value) {
    if (value!.isEmpty) return 'Enter an proper email address';
    RegExp emailReg = RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailReg.hasMatch(value)) {
      return 'Enter an proper email address';
    }
    return null;
  }
  String? _validatePhone(value) {
    if (value!.isEmpty) return 'Phone number must contain 11 digits';
    RegExp phoneReg = RegExp(r'^[0-9]');
    if (!phoneReg.hasMatch(value)) {
      return 'Enter proper number';
    }
    if (value.length != 11) return 'Phone Number must contain 11 digits';
    return null;
  }
  String? _validatePassword(value) {
    if (value!.isEmpty) return 'Password must be 8 characters or longer';
    if (value.length <= 7) return 'Password must be 8 characters or longer';
    return null;
  }
  String? _validateHandle(value) {
    if (value!.isEmpty) return 'Must provide handle';
    return null;
  }
  ////////////////////////////////////////////////  VALIDATOR   ///////////////////////////////////////////////////


  ////////////////////////////////////////////////  DATE OF BIRTH INPUT   ///////////////////////////////////////////////////
  Widget datePicker() {
    return GestureDetector(
      onTap: () {
        _selectDate(context);
      },
      child: Container(
        padding: EdgeInsets.all(11.6),
        height: 62,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Color(0xff525151),
          border: Border.all(
            color: Color(0xffab9784),
            width: 4,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today,
              size: 20,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              selectedDate == null
                  ? ' Insert Date of Birth'
                  : '${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  String formatDate(DateTime date) {
    return '${date.day}-${date.month}-${date.year}';
  }
  String dateDise(){
    String date = "";
    date = selectedDate != null ? formatDate(selectedDate!) : '';
    return date;
  }
  ////////////////////////////////////////////////  DATE OF BIRTH INPUT   ///////////////////////////////////////////////////


  ////////////////////////////////////////////////  LESGO TO SUMIT's PAGE   ///////////////////////////////////////////////////
  void snackBarMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
  int _proceed() {
    if (_formKey.currentState!.validate()) {
      if ((dateDise().isEmpty) && (districtInput == null || districtInput.isEmpty) && (thanaInput == null || thanaInput.isEmpty)) {
        snackBarMessage('Date of Birth, District and Thana fields are mandatory.');
        return 11;
      }
      if ((districtInput == null || districtInput.isEmpty) && (thanaInput == null || thanaInput.isEmpty)) {
        snackBarMessage('Please input District and Thana.');
        return 11;
      }
      if ((dateDise().isEmpty) && (thanaInput == null || thanaInput.isEmpty)) {
        snackBarMessage('Please input Date of Birth and Thana.');
        return 11;
      }
      if ((dateDise().isEmpty) && (districtInput == null || districtInput.isEmpty)) {
        snackBarMessage('Please input Date of Birth and District.');
        return 11;
      }
      if (districtInput == null || districtInput.isEmpty) {
        snackBarMessage('Provide your district info');
        return 11;
      }
      if (thanaInput == null || thanaInput.isEmpty) {
        snackBarMessage('Provide your thana info');
        return 11;
      }
      if (dateDise().isEmpty) {
        snackBarMessage('Provide Date of Birth');
        return 11;
      }

      String userFullName = fullNameInput.text.toString();
      String userPassword = passwordInput.text.toString();
      String userPhoneNumber = phoneNumberInput.text.toString();
      String userEmail = emailInput.text.toString();
      String userHandle = handleInput.text.toString();
      String userDateOfBirth = selectedDate != null ? formatDate(selectedDate!) : '';

      print("userName: $userFullName");
      print("pass: $userPassword");
      print("phone: $userPhoneNumber");
      print("email: $userEmail");
      print("handle: $userHandle");
      print("date of birth: $userDateOfBirth");
      print("district: $districtInput");
      print("thana: $thanaInput");
    }
    else if(!_formKey.currentState!.validate()){
      if ((dateDise().isEmpty) && (districtInput == null || districtInput.isEmpty) && (thanaInput == null || thanaInput.isEmpty)) {
        snackBarMessage('Date of Birth, District and Thana fields are mandatory.');
        return 11;
      }
      if ((districtInput == null || districtInput.isEmpty) && (thanaInput == null || thanaInput.isEmpty)) {
        snackBarMessage('Please input District and Thana.');
        return 11;
      }
      if ((dateDise().isEmpty) && (thanaInput == null || thanaInput.isEmpty)) {
        snackBarMessage('Please input Date of Birth and Thana.');
        return 11;
      }
      if ((dateDise().isEmpty) && (districtInput == null || districtInput.isEmpty)) {
        snackBarMessage('Please input Date of Birth and District.');
        return 11;
      }
      if (districtInput == null || districtInput.isEmpty) {
        snackBarMessage('who will provide the district??');
        return 11;
      }
      if (thanaInput == null || thanaInput.isEmpty) {
        snackBarMessage('Provide your thana info');
        return 11;
      }
      if (dateDise().isEmpty) {
        snackBarMessage('jonmo kobe vai??');
        return 11;
      }

      String userFullName = fullNameInput.text.toString();
      String userPassword = passwordInput.text.toString();
      String userPhoneNumber = phoneNumberInput.text.toString();
      String userEmail = emailInput.text.toString();
      String userHandle = handleInput.text.toString();
      String userDateOfBirth = selectedDate != null ? formatDate(selectedDate!) : '';

      print("userName: $userFullName");
      print("pass: $userPassword");
      print("phone: $userPhoneNumber");
      print("email: $userEmail");
      print("handle: $userHandle");
      print("date of birth: $userDateOfBirth");
      print("district: $districtInput");
      print("thana: $thanaInput");
    }

    return 69;

  }
  ////////////////////////////////////////////////  LESGO TO SUMIT's PAGE   ///////////////////////////////////////////////////


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2a2a2b),
        centerTitle: true,
        title: Text(
          'Sign Up Info',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Color(0xFF000000),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 2,),
                      TextFormField(
                        controller: fullNameInput,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.account_box,
                            color: Colors.white,
                          ),
                          labelText: 'Full Name',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          filled: true,
                          fillColor: Color(0xff525151),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 4,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(
                              color: Color(0xffab9784),
                              width: 4,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(
                              color: Color(0xffc22333),
                              width: 4,
                            ),
                          ),
                          errorStyle: TextStyle(color: Colors.red),
                        ),
                        validator: _validateName,
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        controller: passwordInput,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
                        obscuringCharacter: '*',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.white,
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          filled: true,
                          fillColor: Color(0xff525151),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 4,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(
                              color: Color(0xffab9784),
                              width: 4,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(
                              color: Color(0xffc22333),
                              width: 4,
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
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.supervisor_account,
                            color: Colors.white,
                          ),
                          labelText: 'Handle',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          filled: true,
                          fillColor: Color(0xff525151),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 4,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(
                              color: Color(0xffab9784),
                              width: 4,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(
                              color: Color(0xffc22333),
                              width: 4,
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
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          filled: true,
                          fillColor: Color(0xff525151),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 4,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(
                              color: Color(0xffab9784),
                              width: 4,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(
                              color: Color(0xffc22333),
                              width: 4,
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
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          filled: true,
                          fillColor: Color(0xff525151),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 4,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(
                              color: Color(0xffab9784),
                              width: 4,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide(
                              color: Color(0xffc22333),
                              width: 4,
                            ),
                          ),
                          errorStyle: TextStyle(color: Colors.red),
                        ),
                        validator: _validateEmail,
                      ),
                      SizedBox(height: 15,),
                      datePicker(),
                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.all(15.0),
                        height: 62,
                        decoration: BoxDecoration(
                          color: Color(0xff525151),
                          border: Border.all(
                            color: Color(0xffab9784),
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: DropdownButton<String>(
                          hint: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                              Text(
                                " District",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          value: districtInput,
                          dropdownColor: Color(0xffbfb59b),
                          icon: Icon(
                            Icons.arrow_drop_down_circle,
                            color: Colors.white,
                          ),
                          iconSize: 22, // Adjusted icon size
                          iconEnabledColor: Colors.black,
                          isExpanded: true,
                          focusColor: Colors.red,
                          underline: SizedBox(),
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          items: [
                            'Dhaka',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: districtInput == value ? Colors.white : Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              districtInput = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.all(15.0),
                        height: 62,
                        decoration: BoxDecoration(
                          color: Color(0xff525151),
                          border: Border.all(
                            color: Color(0xffab9784),
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: DropdownButton<String>(
                          hint: Row(
                            children: [
                              Icon(
                                Icons.add_location,
                                color: Colors.white,
                              ),
                              Text(
                                " Thana",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          value: thanaInput,
                          dropdownColor: Color(0xffbfb59b),
                          icon: Icon(
                            Icons.arrow_drop_down_circle,
                            color: Colors.white,
                          ),
                          iconSize: 22,
                          iconEnabledColor: Colors.black,
                          isExpanded: true,
                          focusColor: Colors.red,
                          underline: SizedBox(),
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          items: [
                            'Adabar',
                            'Badda',
                            'Bangsal',
                            'Bimanbandar',
                            'Cantonment',
                            'Chowkbazar',
                            'Darus Salam',
                            'Demra',
                            'Dhakshinkhan',
                            'Dhanmondi',
                            'Gendaria',
                            'Gulshan',
                            'Hazaribagh',
                            'Jatrabari',
                            'Kadamtali',
                            'Kafrul',
                            'Kalabagan',
                            'Kamrangirchar',
                            'Khilgaon',
                            'Khilkhet',
                            'Kotwali',
                            'Lalbagh',
                            'Mirpur Model',
                            'Mohammadpur',
                            'New Market',
                            'Pallabi',
                            'Paltan',
                            'Panthapath',
                            'Ramna',
                            'Rampura',
                            'Sabujbagh',
                            'Shah Ali',
                            'Shahba',
                            'Sher-e-Bangla Nagar',
                            'Shyampur',
                            'Sutrapur',
                            'Tejgaon Industrial Area',
                            'Tejgaon',
                            'Turag',
                            'Uttar Khan',
                            'Vatara',
                            'Wari',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: thanaInput == value ? Colors.white : Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              thanaInput = value;
                            });
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  if(_proceed() == 69){
                    Navigator.pushNamed(context, '/physical');
                  }
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(10.0),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  ),
                ),
                child: Text(
                  'Proceed to Physical Info',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}