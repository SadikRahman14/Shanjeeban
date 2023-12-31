import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhysicalInformationPage extends StatefulWidget {

  @override
  State<PhysicalInformationPage> createState() => _PhysicalInformationPageState();
}

class _PhysicalInformationPageState extends State<PhysicalInformationPage> {
  final formKey = GlobalKey<FormState>();
  var   GenderInput;
  var   AgeInput = TextEditingController();
  var   HeightInput = TextEditingController();
  var   WeightInput = TextEditingController();
  var   BloodGroupInput ;
  var   LastDonationInput ;
  DateTime? selectedDate;

  String? _validateAge(value) {
    if (value!.isEmpty) return 'This field is mandatory';
    RegExp phoneReg = RegExp(r'^[0-9]');
    if (!phoneReg.hasMatch(value)) {
      return 'Enter proper age.';
    }
    return null;
  }
  String? _validateWeight(value) {
    if (value!.isEmpty) return 'This field is mandatory';
    RegExp phoneReg = RegExp(r'^[0-9]');
    if (!phoneReg.hasMatch(value)) {
      return 'Enter proper weight.';
    }
    return null;
  }
  String? _validateHeight(value) {
    if (value!.isEmpty) return 'This field is mandatory';
    RegExp phoneReg = RegExp(r'^[0-9]');
    if (!phoneReg.hasMatch(value)) {
      return 'Enter proper height.';
    }
    return null;
  }

  Widget  LastDonationDate() {
    return GestureDetector(
      onTap: () {
        _selectDate(context);
      },
      child: Container(
        padding: EdgeInsets.all(25),
        height: 80,
        decoration: BoxDecoration(
            color: Color(0xff525151),
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: Color(0xffab9784) ,
              width: 3,
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate == null
                  ? ' Last Donation Date'
                  : '${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins-Medium',
              ),
            ),

            SizedBox(width: 83),

            Icon(
              Icons.calendar_today,
              size: 21,
              color: Colors.black,
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

  void snackBarMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
  void proceed ({required String cha, required String name, required String pass, required String number, required String email, required String handle, required String dateOfBirth, required String district, required String thana}) async {
    if (formKey.currentState!.validate()) {
      if ((dateDise().isEmpty) && (BloodGroupInput == null || BloodGroupInput.isEmpty) && (GenderInput == null || GenderInput.isEmpty)) {
        snackBarMessage('Date of Birth, Blood Group and Gender fields are mandatory.');
        return;
      }
      if ((BloodGroupInput == null || BloodGroupInput.isEmpty) && (GenderInput == null || GenderInput.isEmpty)) {
        snackBarMessage('Please input Blood Group and Gender.');
        return ;
      }
      if ((dateDise().isEmpty) && (GenderInput == null || GenderInput.isEmpty)) {
        snackBarMessage('Please input Date of Birth and Gender.');
        return ;
      }
      if ((dateDise().isEmpty) && (BloodGroupInput == null || BloodGroupInput.isEmpty)) {
        snackBarMessage('Please input Date of Birth and Blood Group.');
        return ;
      }
      if (BloodGroupInput == null || BloodGroupInput.isEmpty) {
        snackBarMessage('Blood Group field is empty');
        return ;
      }
      if (GenderInput == null || GenderInput.isEmpty) {
        snackBarMessage('Gender field is empty');
        return ;
      }
      if (dateDise().isEmpty) {
        snackBarMessage('Please input your date of birth');
        return ;
      }

      String age = AgeInput.text.toString().trim();
      String height = HeightInput.text.toString().trim();
      String weight = WeightInput.text.toString().trim();
      String gender = GenderInput.toString().trim();
      String lastDonation = dateDise();
      String bloodGroup = BloodGroupInput.toString().trim();

      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);
        if(userCredential.user != null){
          print("user created successfully.");

          int etaki244 = int.parse(number);
          int boyosh = int.parse(age);
          int ucchota = int.parse(height);
          int vor = int.parse(weight);

          Map <String, dynamic> userData = {
            "name" : name,
            "pass" : pass,
            "number" : etaki244,
            "name" : name,
            "email" : email,
            "handle" : handle,
            "dateOfBirth" : dateOfBirth,
            "district" : district,
            "thana" : thana,
            "age" : boyosh,
            "height" : ucchota,
            "weight" : vor,
            "bloodGroup" : bloodGroup,
            "gender" : gender,
            "lastDonation" : lastDonation,
          };

          FirebaseFirestore.instance.collection("userCredentials").add(userData);
          Navigator.pushNamed(context, '/physical');
        }
      } on FirebaseAuthException catch (ex) {
        print(ex.code.toString());
        snackBarMessage('error occured.');
        // if(ex.code.toString() == "weak-password"){}  eivabe specific error dhora jabe
      }

      print("form filled up");
      print("to login");
      print(cha);
      print(name);
      print(pass);
      print(number);
      print(handle);
      print(dateOfBirth);
      print(email);
      print(age);
      print(height);
      print(weight);
      print(gender);
      print(lastDonation);
      print(bloodGroup);
      print(cha);
      print("storing info in database");

      Navigator.pushNamed(context, '/loginPage');
    }

    else if (!formKey.currentState!.validate()) {
      if ((dateDise().isEmpty) && (BloodGroupInput == null || BloodGroupInput.isEmpty) && (GenderInput == null || GenderInput.isEmpty)) {
        snackBarMessage('Date of Birth, Blood Group and Gender fields are mandatory.');
        return ;
      }
      if ((BloodGroupInput == null || BloodGroupInput.isEmpty) && (GenderInput == null || GenderInput.isEmpty)) {
        snackBarMessage('Please input Blood Group and Gender.');
        return ;
      }
      if ((dateDise().isEmpty) && (GenderInput == null || GenderInput.isEmpty)) {
        snackBarMessage('Please input Date of Birth and Gender.');
        return ;
      }
      if ((dateDise().isEmpty) && (BloodGroupInput == null || BloodGroupInput.isEmpty)) {
        snackBarMessage('Please input Date of Birth and Blood Group.');
        return ;
      }
      if (BloodGroupInput == null || BloodGroupInput.isEmpty) {
        snackBarMessage('Blood Group field is empty');
        return ;
      }
      if (GenderInput == null || GenderInput.isEmpty) {
        snackBarMessage('Gender field is empty');
        return ;
      }
      if (dateDise().isEmpty) {
        snackBarMessage('Please input your date of birth');
        return ;
      }
    }
  }


  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> formData = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String line = formData['cha'];
    String name = formData['name'];
    String pass = formData['pass'];
    String number = formData['number'];
    String email = formData['email'];
    String handle = formData['handle'];
    String dateOfBirth = formData['dateOfBirth'];
    String district = formData['district'];
    String thana = formData['thana'];

    return Scaffold(
      //appBar: AppBar(
      // title: Text('Shanjeeban'),
      // ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.all(25.0),
          child : Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 30,),

                Text(
                  "Physical Information",
                  style: TextStyle(
                      fontSize: 27,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 43,),

                TextFormField(
                  controller: AgeInput,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-Medium'),
                  decoration: InputDecoration(filled: true, fillColor: Color(0xff525151),
                    contentPadding: EdgeInsets.all(28),
                    labelText: "Age",
                    labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins-Medium'),
                    border:
                    OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffab9784)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffab9784), width: 4.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 4.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: _validateAge,
                ),

                SizedBox(height: 17.0),


                TextFormField(
                  controller: HeightInput,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-Medium'),
                  decoration: InputDecoration(filled: true, fillColor: Color(0xff525151),
                    contentPadding: EdgeInsets.all(28),
                    labelText: "Height (in cm)",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-Medium',
                    ),
                    border:
                    OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffab9784)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffab9784), width: 4.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 4.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: _validateHeight,
                ),

                SizedBox(height: 17.0),


                TextFormField(
                  controller: WeightInput,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-Medium'),
                  decoration: InputDecoration(filled: true, fillColor: Color(0xff525151),
                    contentPadding: EdgeInsets.all(28),
                    labelText: "Weight (in kg)",
                    labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins-Medium'),

                    border:
                    OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffab9784)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffab9784), width: 4.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 4.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: _validateWeight,
                ),

                SizedBox(height: 17.0),




                Container(
                  padding: EdgeInsets.all(25.0),
                  height: 80,

                  decoration: BoxDecoration(
                    color: Color(0xff525151),
                    border: Border.all(color: Color(0xffab9784),width: 4),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: DropdownButton<String>(
                    hint: Text(" Blood Group",
                      style: TextStyle(
                          fontSize:18 ,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins-Medium'),
                    ),
                    value:  BloodGroupInput,
                    dropdownColor: Colors.brown,
                    icon: Icon(Icons.add),
                    iconSize: 26,
                    iconEnabledColor: Colors.black,
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins-Medium'),

                    items: [
                      'A+',
                      'A-',
                      'B+',
                      'B-',
                      'AB+',
                      'AB-',
                      'O+',
                      'O-',
                      'None of These'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        BloodGroupInput = value;
                      });
                    },
                  ),
                ),

                SizedBox(height: 17.0),

                Container(
                  padding: EdgeInsets.all(25.0),
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color(0xff525151),
                    border: Border.all(color: Color(0xffab9784),width: 4),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: DropdownButton<String>(
                    hint: Text(" Gender",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins-Medium'),
                    ),
                    value:GenderInput ,
                    dropdownColor: Colors.brown,
                    icon: Icon(Icons.add),
                    iconSize: 25,
                    iconEnabledColor: Colors.black,
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins-Medium'),

                    items: [
                      'Male',
                      'Female',
                      'None of These'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        GenderInput = value;
                      }); // Handle the blood group sele // Handle the blood group selection
                    },
                  ),
                ),

                SizedBox(height: 17.0),


                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LastDonationDate (),
                    SizedBox(height: 43.0),
                    ElevatedButton(
                      onPressed: () {
                         proceed(
                          cha: line,
                          name: name,
                          pass: pass,
                          number: number,
                          email: email,
                          handle: handle,
                          dateOfBirth: dateOfBirth,
                          district: district,
                          thana: thana,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: Size(36, 36),
                      ),
                      child: Text(line,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins-Medium'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}