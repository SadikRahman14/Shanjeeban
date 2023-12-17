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
      body: Container(
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
            )
            ,
            SizedBox(height: 30,),


            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(filled: true, fillColor: Colors.grey,
                labelText: " Age",
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

            SizedBox(height: 16.0),

            /*TextFormField(
              decoration: InputDecoration(
                labelText: "Blood Group",
                labelStyle: TextStyle(fontSize: 18, color: Colors.black87),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

              ),
            ),
           // SizedBox(height: 8.0),
             DropdownButtonFormField<String>(
              items: [
                'A+',
                'A-',
                'B',
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
            ),*/

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(filled: true, fillColor: Colors.grey,
                  labelText: " Height(in cm)",
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
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

            SizedBox(height: 16.0),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(filled: true, fillColor: Colors.grey,
                  labelText: " Weight(in kg)",
                  labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
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

            SizedBox(height: 16.0),



            Text(
              'Blood Group',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'Poppins-Medium'),
            ),
            SizedBox(height: 1.0),
            DropdownButtonFormField<String>(
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

            SizedBox(height: 16.0),

            Text(
              'Gender:',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'Poppins-Medium'),
            ),
            SizedBox(height: 1.0),
            DropdownButtonFormField<String>(
              items: ['Male', 'Female'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                // Handle the gender selection
              },
            ),


            SizedBox(height: 20.0),


            TextField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(filled: true, fillColor: Colors.grey,
                  labelText: " Last Donation Date",
                  labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
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

            SizedBox(height: 35.0),


            Text(
              'Blood Test Certificate',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.lightGreenAccent,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins-Medium'),
            ),

            SizedBox(height: 10.0),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white70,
                // minimumSize: Size(30, 30),
              ),
              child: Text(
                'Choose File',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black87,
                    fontFamily: 'Poppins-Medium'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
