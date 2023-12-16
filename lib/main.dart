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
            Text("Physical Information",
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Age",
                  labelStyle: TextStyle(fontSize: 19, color: Colors.black87),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              ),
            ),
            SizedBox(height: 10.0),

            TextField(
              decoration: InputDecoration(
                labelText: "Blood Group",
                labelStyle: TextStyle(fontSize: 19, color: Colors.black87),
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
            ),

            SizedBox(height: 8.0),
            /*TextField(
              label: 'Blood group:',
              child: DropdownButtonFormField<String>(
                items: ['A', 'B', 'AB', 'O'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  // Handle the blood group selection
                },
              ),
            ),*/
            TextField(
              decoration: InputDecoration(
                  labelText: "Height",
                  labelStyle: TextStyle(fontSize: 19, color: Colors.black87),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                  labelText: "Weight",
                  labelStyle: TextStyle(fontSize: 19, color: Colors.black87),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Gender:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
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
            SizedBox(height: 16.0),
            Text(
              'Last Donation Date:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              // You can use a date picker here
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'Blood Test Certificate:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Handle file selection
              },
              child: Text('Choose File'),
            ),
          ],
        ),
      ),
    );
  }
}

