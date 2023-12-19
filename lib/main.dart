import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhysicalInformationPage(),
    );
  }
}

class PhysicalInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shanjeeban'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blue,
          padding: EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Physical Information",
                style: TextStyle(
                    fontSize: 27,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 22,),

              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(filled: true, fillColor: Colors.grey,
                 contentPadding: EdgeInsets.all(28),
                  labelText: "Age",
                  labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-Medium'),
                  border:
                      OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(18.0),
                      ),
                  enabledBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(18.0),
                ),
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87, width: 2.0),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),

              SizedBox(height: 13.0),


              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(filled: true, fillColor: Colors.grey,
                  contentPadding: EdgeInsets.all(28),
                  labelText: "Height (in cm)",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-Medium',
                    ),
                  border:
                  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  enabledBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87, width: 2.0),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),

              SizedBox(height: 13.0),

              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(filled: true, fillColor: Colors.grey,
                  contentPadding: EdgeInsets.all(28),
                  labelText: "Weight (in kg)",
                    labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins-Medium'),

                  border:
                  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  enabledBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87, width: 2.0),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),

              SizedBox(height: 13.0),




              Container(
                padding: EdgeInsets.all(25.0),
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey,
                border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: DropdownButton<String>(
                  hint: Text(" Blood Group",
                      style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                          fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-Medium'),
                  ),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.add),
                  iconSize: 26,
                  iconEnabledColor: Colors.black,
                  isExpanded: true,
                  underline: SizedBox(),
                  style: TextStyle(
                      fontSize: 17,
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
                    // Handle the blood group selection
                  },
                ),
              ),

              SizedBox(height: 13.0),

              Container(
                padding: EdgeInsets.all(25.0),
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: DropdownButton<String>(
                  hint: Text(" Gender",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins-Medium'),
                  ),
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
                    // Handle the blood group selection
                  },
                ),
              ),

              SizedBox(height: 13.0),




              TextField(
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(filled: true, fillColor: Colors.grey,
                  contentPadding: EdgeInsets.all(28),
                    labelText: " Last Donation Date",
                    labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins-Medium'),
                  border:
                  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  enabledBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87, width: 2.0),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),

              SizedBox(height: 20.0),



              Text(
                'Blood Test Certificate',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.lightGreenAccent,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins-Medium'),
              ),

              SizedBox(height: 6.0),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white70,
                   minimumSize: Size(30, 30),
                ),
                child: Text(
                  'Choose File',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-Medium'),
                ),
              ),

             // SizedBox(height: 6.0),

              ElevatedButton(

            onPressed: () {
              //Navigator.push(
              //context,
              // MaterialPageRoute(builder: (context) => HomePage()),
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white70,
              minimumSize: Size(40, 30),
            ),
            child: Text('Submit',
                style: TextStyle(
                fontSize: 14.0,
                color: Colors.black87,
                    fontWeight: FontWeight.bold,
                fontFamily: 'Poppins-Medium'),
            ),
          ),


            ],
          ),
        ),
      ),
    );
  }
}





