import 'package:flutter/material.dart';
import 'package:login/rakibul/loginPage.dart';

class PhysicalInformationPage extends StatefulWidget {

  @override
  State<PhysicalInformationPage> createState() => _PhysicalInformationPageState();
}

class _PhysicalInformationPageState extends State<PhysicalInformationPage> {

  final formKey = GlobalKey<FormState>();

  var   BloodInput ;
  var   GenderInput;
  var   AgeInput = TextEditingController();
  var   HeightInput = TextEditingController();
  var   WeightInput = TextEditingController();
  var   BloodGroupInput ;
  var   GenderSelectionInput ;
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
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: Colors.amber ,
              width: 4,
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
                color: Colors.black,
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
  int proceed() {

    if (formKey.currentState!.validate()) {
      if ((dateDise().isEmpty) && (BloodGroupInput == null || BloodGroupInput.isEmpty) && (GenderInput == null || GenderInput.isEmpty)) {
        snackBarMessage('Last Donation Date, Blood Group and Gender fields are mandatory.');
        return 11;
      }
      if ((BloodGroupInput == null || BloodGroupInput.isEmpty) && (GenderInput == null || GenderInput.isEmpty)) {
        snackBarMessage('Please input Blood Group and Gender.');
        return 11;
      }
      if ((dateDise().isEmpty) && (GenderInput == null || GenderInput.isEmpty)) {
        snackBarMessage('Please input Last Donation Date and Gender.');
        return 11;
      }
      if ((dateDise().isEmpty) && (BloodGroupInput == null || BloodGroupInput.isEmpty)) {
        snackBarMessage('Please input Last Donation Date and Blood Group.');
        return 11;
      }
      if (BloodGroupInput == null || BloodGroupInput.isEmpty) {
        snackBarMessage('Blood Group field is empty');
        return 11;
      }
      if (GenderInput == null || GenderInput.isEmpty) {
        snackBarMessage('Gender field is empty');
        return 11;
      }
      if (dateDise().isEmpty) {
        snackBarMessage('Please input your Last Donation Date');
        return 11;
      }
    }

    else if (!formKey.currentState!.validate()) {
      if ((dateDise().isEmpty) && (BloodGroupInput == null || BloodGroupInput.isEmpty) && (GenderInput == null || GenderInput.isEmpty)) {
        snackBarMessage('Last Donation Date, Blood Group and Gender fields are mandatory.');
        return 11;
      }
      if ((BloodGroupInput == null || BloodGroupInput.isEmpty) && (GenderInput == null || GenderInput.isEmpty)) {
        snackBarMessage('Please input Blood Group and Gender.');
        return 11;
      }
      if ((dateDise().isEmpty) && (GenderInput == null || GenderInput.isEmpty)) {
        snackBarMessage('Please input Last Donation Date and Gender.');
        return 11;
      }
      if ((dateDise().isEmpty) && (BloodGroupInput == null || BloodGroupInput.isEmpty)) {
        snackBarMessage('Please input Last Donation Date and Blood Group.');
        return 11;
      }
      if (BloodGroupInput == null || BloodGroupInput.isEmpty) {
        snackBarMessage('Blood Group field is empty');
        return 11;
      }
      if (GenderInput == null || GenderInput.isEmpty) {
        snackBarMessage('Gender field is empty');
        return 11;
      }
      if (dateDise().isEmpty) {
        snackBarMessage('Please input your Last Donation Date');
        return 11;
      }
    }

    return 69;
  }


  @override
  Widget build(BuildContext context) {

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

                SizedBox(height: 40,),

               /* Text(
                  "Physical Information",
                  style: TextStyle(
                      fontSize: 27,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 43,),*/

                TextFormField(
                  controller: AgeInput,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-Medium'),
                  decoration: InputDecoration(filled: true, fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(17),
                    labelText: "Age",
                    labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins-Medium'),
                    border:
                    OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber, width: 4.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 4.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: _validateAge,
                ),

                SizedBox(height: 19.0),


                TextFormField(
                  controller: HeightInput,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-Medium'),
                  decoration: InputDecoration(filled: true, fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(17),
                    labelText: "Height (in cm)",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-Medium',
                    ),
                    border:
                    OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber, width: 4.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 4.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: _validateHeight,
                ),

                SizedBox(height: 19.0),


                TextFormField(
                  controller: WeightInput,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-Medium'),
                  decoration: InputDecoration(filled: true, fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(17),
                    labelText: "Weight (in kg)",
                    labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins-Medium'),

                    border:
                    OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber, width: 4.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 4.0),
                      borderRadius: BorderRadius.circular(20.0),
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
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: DropdownButton<String>(
                    hint: Text(" Blood Group",
                      style: TextStyle(
                          fontSize:18 ,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins-Medium'),
                    ),
                    value:  BloodGroupInput,
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.add),
                    iconSize: 26,
                    iconEnabledColor: Colors.black,
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(
                        fontSize: 19,
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
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: DropdownButton<String>(
                    hint: Text(" Gender",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins-Medium'),
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

                    SizedBox(height: 100.0),

                    ElevatedButton(
                      onPressed: () {
                        if (proceed() == 69) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        }
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