import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhysicalInformationPage(),
    );
  }
}

class PhysicalInformationPage extends StatefulWidget {

  @override
  State<PhysicalInformationPage> createState() => _PhysicalInformationPageState();
}

class _PhysicalInformationPageState extends State<PhysicalInformationPage> {

  var   BloodInput ;
  var   GenderInput;

  var   AgeInput = TextEditingController();
  var   HeightInput = TextEditingController();
  var   WeightInput = TextEditingController();


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
          color: Color(0xFFFFF4E3),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: Row(
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
       // title: Text('Shanjeeban'),
     // ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFF000040),
          padding: EdgeInsets.all(25.0),
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
                decoration: InputDecoration(filled: true, fillColor: Color(0xFFFFF4E3),
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

              SizedBox(height: 17.0),


              TextField(
                controller: HeightInput,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(filled: true, fillColor: Color(0xFFFFF4E3),
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

              SizedBox(height: 17.0),


              TextField(
                controller: WeightInput,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(filled: true, fillColor: Color(0xFFFFF4E3),
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

              SizedBox(height: 17.0),




              Container(
                padding: EdgeInsets.all(25.0),
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xFFFFF4E3),
                border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: DropdownButton<String>(
                  hint: Text(" Blood Group",
                      style: TextStyle(
                      fontSize:19 ,
                      color: Colors.black,
                          fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-Medium'),
                  ),
                  value:  BloodInput ,
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
                  color: Color(0xFFFFF4E3),
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

              SizedBox(height: 17.0),


              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


              LastDonationDate (),



              SizedBox(height: 43.0),




        /*  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text(
                'Blood Test Certificate',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.lightGreenAccent,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins-Medium'),
              ),

              SizedBox(width: 13.0),


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

           ],
          ),*/



              ElevatedButton(
                onPressed: () {
              //Navigator.push(
              //context,
              // MaterialPageRoute(builder: (context) => HomePage()),
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: Size(40, 40),
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


            ],
          ),
        ),
      ),
    );
  }
}





