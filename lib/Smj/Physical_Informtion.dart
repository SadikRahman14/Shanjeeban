import 'dart:typed_data';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/Smj/add_data.dart';
import 'package:login/Smj/utils.dart';
import 'package:login/main.dart';

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
        padding: EdgeInsets.all(15),
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13.0),
            border: Border.all(
              color: Colors.amber ,
              width: 4,
            )
        ),
        child: Row(

          children: [
            Icon(
              Icons.calendar_today,
              size: 21,
              color: Colors.black,
            ),
            SizedBox(width: 8),
            Text(
              selectedDate == null
                  ? '   Last Donation Date'
                  : '${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins-Medium',
              ),
            ),

            SizedBox(width: 83),


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
      String ID = "";
      String docID = "";


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

          DocumentReference documentReference1 = await FirebaseFirestore.instance.collection("userCredentials").doc(email);
          await documentReference1.set(userData)
              .then((value) {
            print("Document added successfully!");
            docID = email;
            print("Document ID: $docID");
          })
              .catchError((error) {
            print("Error adding document: $error");
          });

          

          Map<String, dynamic> uData = {
            "email": email,
            "docID": email,
            "name" : name,
            "pass" : pass,
            "number" : etaki244,
            "name" : name,
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

          DocumentReference docRef = await FirebaseFirestore.instance.collection("userIdHolder").doc(ID);
          await docRef.set(uData)
              .then((value) {
            print("Document added successfully!");
            docID = email;
            print("Document ID: $docID");
          })
              .catchError((error) {
            print("Error adding document: $error");
          });



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

  Uint8List? _image;


  void selectImage() async{
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void saveProfile() async{

    String resp = await StoreData().saveData(file:  _image!);
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
      appBar: AppBar(
        backgroundColor:   Color(0xff2a2a2b),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.red,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Physical Information",
          style: TextStyle(
            fontSize: 23,
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            //fontFamily: 'Poppins-Medium'
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Container(

          padding: EdgeInsets.all(15.0),
          child : Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 10,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Stack(
                      children: [
                        _image != null ?
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: MemoryImage(_image!),
                        ):

                        const CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('assetsSadik/Profile.jpg'),
                        ),
                        Positioned(
                          child: IconButton(
                            onPressed: selectImage,
                            icon: const Icon(Icons.add_a_photo),
                            color: Colors.amber,
                          ),
                          bottom: -10,
                          left: 80,
                        )
                      ],
                    ),

                    SizedBox(height: 20,),

                    TextFormField(
                      controller: AgeInput,
                      keyboardType: TextInputType.number,

                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins-Medium'),
                      decoration: InputDecoration(filled: true, fillColor: Colors.white,
                        contentPadding: EdgeInsets.all(17),
                        prefixIcon: Icon(
                          Icons.person_add,
                          color: Colors.black,
                        ),
                        labelText: " Age",
                        labelStyle: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins-Medium'),
                        border:
                        OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber, width: 4.0),
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 4.0),
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                      ),
                      validator: _validateAge,
                    ),

                  ],
                ),

                SizedBox(height: 19.0),


                TextFormField(
                  controller: HeightInput,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-Medium'),
                  decoration: InputDecoration(filled: true, fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(17),
                    prefixIcon: Icon(
                      Icons.height,
                      color: Colors.black,
                    ),
                    labelText: " Height (in cm)",
                    labelStyle: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-Medium',
                    ),
                    border:
                    OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber, width: 4.0),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 4.0),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                  ),
                  validator: _validateHeight,
                ),

                SizedBox(height: 19.0),


                TextFormField(
                  controller: WeightInput,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-Medium'),
                  decoration: InputDecoration(filled: true, fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(17),
                    prefixIcon: Icon(
                      Icons.line_weight,
                      color: Colors.black,
                    ),
                    labelText: " Weight (in kg)",
                    labelStyle: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins-Medium'),

                    border:
                    OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber, width: 4.0),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 4.0),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                  ),
                  validator: _validateWeight,
                ),

                SizedBox(height: 19.0),





                Container(
                  padding: EdgeInsets.all(15.0),
                  height: 63,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.amber,width: 4),
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: DropdownButton<String>(
                    hint: Row(
                      children: [
                        Icon(
                          Icons.bloodtype,
                          color: Colors.black,
                        ),
                        Text("   Blood Group",
                          style: TextStyle(
                              fontSize:17 ,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins-Medium'),
                        ),
                      ],
                    ),


                    value:  BloodGroupInput,
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.add),
                    iconSize: 26,
                    iconEnabledColor: Colors.black,
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
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

                SizedBox(height: 19.0),

                Container(
                  padding: EdgeInsets.all(15.0),
                  height: 62,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.amber,width: 4),
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: DropdownButton<String>(
                    hint: Row(
                      children: [
                        Icon(
                          Icons.perm_identity_sharp,
                          color: Colors.black,
                        ),

                        Text("    Gender",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins-Medium'),
                        ),
                      ],
                    ),
                    value:GenderInput ,
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.add),
                    iconSize: 25,
                    iconEnabledColor: Colors.black,
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
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

                SizedBox(height: 19.0),


                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LastDonationDate (),

                    SizedBox(height: 35.0),

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
                        minimumSize: Size(45, 45),
                      ),
                      child: Text('Submit',
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
