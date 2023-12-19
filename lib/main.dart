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

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  var fullNameInput = TextEditingController();
  var passwordInput = TextEditingController();
  var phoneNumberInput = TextEditingController();
  var handleInput = TextEditingController();
  var emailInput = TextEditingController();
  DateTime? selectedDate;
  var districtInput = TextEditingController();
  var thanaInput = TextEditingController();

  Widget _buildDateField() {
    return GestureDetector(
      onTap: () {
        _selectDate(context);
      },
      child: Container(
        padding: EdgeInsets.all(11.6),
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: Colors.blue,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today,
              size: 24,
              color: Colors.black,
            ),
            SizedBox(width: 8),
            Text(
              selectedDate == null
                  ? 'Insert Date of Birth'
                  : '${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}',
              style: TextStyle(
                fontSize: 18,
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 68,),
                TextField(
                  controller: fullNameInput,
                  decoration: InputDecoration(
                    label : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.account_box,size: 24,),
                        Text(" Full Name"),
                      ],
                    ),
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18,),
                TextField(
                  controller: passwordInput,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    label : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.key,size: 24,),
                        Text(" Password"),
                      ],
                    ),
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18,),
                TextField(
                  controller: phoneNumberInput,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    label : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.phone,size: 24,),
                        Text(" Phone Number"),
                      ],
                    ),
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18,),
                TextField(
                  controller: handleInput,
                  decoration: InputDecoration(
                    label : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.supervisor_account,size: 24,),
                        Text(" Handle"),
                      ],
                    ),
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18,),
                TextField(
                  controller: emailInput,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.email,size: 24,),
                        Text(" Email"),
                      ],
                    ),
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18,),
                _buildDateField(),
                SizedBox(height: 18,),
                TextField(
                  controller: districtInput,
                  decoration: InputDecoration(
                    label : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on,size: 24,),
                        Text(" District"),
                      ],
                    ),
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18,),
                TextField(
                  controller: thanaInput,
                  decoration: InputDecoration(
                    label : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add_location,size: 24,),
                        Text(" Thana"),
                      ],
                    ),
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18,),
                ElevatedButton(
                  onPressed: () {
                    String userFullName = fullNameInput.text.toString();
                    String userPassword = passwordInput.text.toString();
                    String userPhoneNumber = phoneNumberInput.text.toString();
                    String userHandle = handleInput.text.toString();
                    String userEmail = emailInput.text.toString();
                    String userDateOfBirth =
                    selectedDate != null ? formatDate(selectedDate!) : '';
                    String userDistrict = districtInput.text.toString();
                    String userThana = thanaInput.text.toString();

                    print(
                        "userName: $userFullName, password: $userPassword, handle: $userHandle, phone: $userPhoneNumber, dateOfBirth: $userDateOfBirth, district: $userDistrict, thana: $userThana");
                  },
                  child: Text('Proceed to Physical Info'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
