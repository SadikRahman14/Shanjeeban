import 'package:flutter/material.dart';

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
  int proceed() {
    if (formKey.currentState!.validate()) {
      if (HeightInput.text.isEmpty && WeightInput.text.isEmpty && AgeInput.text.isEmpty && BloodGroupInput == null || BloodGroupInput.isEmpty && GenderInput == null || GenderInput.isEmpty && LastDonationInput == null || LastDonationInput.isEmpty) {
        snackBarMessage('Please input all informations');
        return 11;
      }
      if (HeightInput.text.isEmpty && WeightInput.text.isEmpty && AgeInput.text.isEmpty && BloodGroupInput == null || BloodGroupInput.isEmpty && GenderInput == null || GenderInput.isEmpty ) {
        snackBarMessage('Please input all informations');
        return 11;
      }
      if (HeightInput.text.isEmpty && WeightInput.text.isEmpty && AgeInput.text.isEmpty && BloodGroupInput == null || BloodGroupInput.isEmpty &&  LastDonationInput == null || LastDonationInput.isEmpty) {
        snackBarMessage('Please input all informations');
        return 11;
      }
      if (HeightInput.text.isEmpty && WeightInput.text.isEmpty && AgeInput.text.isEmpty  && GenderInput == null || GenderInput.isEmpty && LastDonationInput == null || LastDonationInput.isEmpty) {
        snackBarMessage('Please input all informations');
        return 11;
      }
      if (HeightInput.text.isEmpty && WeightInput.text.isEmpty  && BloodGroupInput == null || BloodGroupInput.isEmpty && GenderInput == null || GenderInput.isEmpty && LastDonationInput == null || LastDonationInput.isEmpty) {
        snackBarMessage('Please input all informations');
        return 11;
      }
      if (HeightInput.text.isEmpty  && AgeInput.text.isEmpty && BloodGroupInput == null || BloodGroupInput.isEmpty && GenderInput == null || GenderInput.isEmpty && LastDonationInput == null || LastDonationInput.isEmpty) {
        snackBarMessage('Please input all informations');
        return 11;
      }
      if ( WeightInput.text.isEmpty && AgeInput.text.isEmpty && BloodGroupInput == null || BloodGroupInput.isEmpty && GenderInput == null || GenderInput.isEmpty && LastDonationInput == null || LastDonationInput.isEmpty) {
        snackBarMessage('Please input all informations');
        return 11;
      }
      if (HeightInput.text.isEmpty && WeightInput.text.isEmpty && AgeInput.text.isEmpty) {
        snackBarMessage('Please input all informations');
        return 11;
      }
      if (HeightInput.text.isEmpty &&  AgeInput.text.isEmpty) {
        snackBarMessage('Please input all informations');
        return 11;
      }
      if (HeightInput.text.isEmpty &&  WeightInput.text.isEmpty) {
        snackBarMessage('Please input all informations');
        return 11;
      }
      if (WeightInput.text.isEmpty &&  AgeInput.text.isEmpty) {
        snackBarMessage('Please input all informations');
        return 11;
      }
      if (WeightInput.text.isEmpty) {
        snackBarMessage('Please input Weight');
        return 11;
      }
      if (HeightInput.text.isEmpty) {
        snackBarMessage('Please input Height');
        return 11;
      }
      if (AgeInput.text.isEmpty) {
        snackBarMessage('Please input Age');
        return 11;
      }
      if (BloodGroupInput == null || BloodGroupInput.isEmpty && GenderInput == null || GenderInput.isEmpty && LastDonationInput == null || LastDonationInput.isEmpty) {
        snackBarMessage('Please input other informations');
        return 11;
      }
      if (BloodGroupInput == null || BloodGroupInput.isEmpty && GenderInput == null || GenderInput.isEmpty ) {
        snackBarMessage('Please input other informations');
        return 11;
      }
      if (BloodGroupInput == null || BloodGroupInput.isEmpty && LastDonationInput == null || LastDonationInput.isEmpty ) {
        snackBarMessage('Please input other informations');
        return 11;
      }
      if (GenderInput == null || GenderInput.isEmpty && LastDonationInput == null || LastDonationInput.isEmpty ) {
        snackBarMessage('Please input other informations');
        return 11;
      }
      if (BloodGroupInput == null || BloodGroupInput.isEmpty) {
        snackBarMessage('Please input Blood Group');
        return 11;
      }

      if (GenderInput == null || GenderInput.isEmpty) {
        snackBarMessage('Please input Gender');
        return 11;
      }
      if (LastDonationInput == null || LastDonationInput.isEmpty) {
        snackBarMessage('Please input Last Donation Date');
        return 11;
      }
    }

    return 69;

  }


  @override
  Widget build(BuildContext context) {

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
                validator: (value){


                }
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
                  value:  BloodInput ,
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
                      BloodInput = value;
                    }); // Handle the blood group selection
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
                    onPressed: (){
                      if(proceed() == 69)
                        Navigator.pushNamed(context, '/loginPage');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: Size(36, 36),
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





