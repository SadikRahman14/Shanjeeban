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
  var districtInput;
  var thanaInput;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String dateDise(){
    String date = "";
    date = selectedDate != null ? formatDate(selectedDate!) : '';
    return date;
  }

  void _proceed() {
    if (_formKey.currentState!.validate() && (districtInput != null && districtInput.isNotEmpty) && dateDise()!=""){
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
  }

  String? _validateName(value) {
    if (value!.isEmpty) return 'Enter proper name';
    RegExp nameReg = RegExp(r'^[a-zA-Z ]+$');
    if (!nameReg.hasMatch(value)) {
      return 'Enter proper name';
    }
    return null;
  }
  String? _validateEmail(value) {
    if (value!.isEmpty) return 'Enter proper email';
    RegExp emailReg = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailReg.hasMatch(value)) {
      return 'Enter proper email';
    }
    return null;
  }
  String? _validatePhone(value) {
    if (value!.isEmpty) return 'Enter proper number';
    RegExp phoneReg = RegExp(r'^[0-9]');
    if (!phoneReg.hasMatch(value)) {
      return 'Enter proper number';
    }
    if (value.length != 11) return 'Enter proper number';
    return null;
  }
  String? _validatePassword(value) {
    if (value!.isEmpty) return 'Password must be 8 characters or longer';
    if (value.length <= 7) return 'Password must be 8 characters or longer';
    return null;
  }
  String? _validateHandle(value) {
    if (value!.isEmpty) return 'Cannot be empty';
    return null;
  }

  Widget _buildDateField() {
    return GestureDetector(
      onTap: () {
        _selectDate(context);
      },
      child: Container(
        padding: EdgeInsets.all(11.6),
        height: 62,
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
              size: 20,
              color: Colors.black,
            ),
            SizedBox(width: 8),
            Text(
              selectedDate == null
                  ? 'Insert Date of Birth'
                  : '${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 65,),
                    TextFormField(
                      controller: fullNameInput,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_box),
                        labelText: 'Full Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.blue.shade700,
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.5,
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
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_box),
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.blue.shade700,
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.5,
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
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_box),
                        labelText: 'Handle',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.blue.shade700,
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.5,
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
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_box),
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.blue.shade700,
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.5,
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
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_box),
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.blue.shade700,
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.5,
                          ),
                        ),
                        errorStyle: TextStyle(color: Colors.blueGrey),
                      ),
                      validator: _validateEmail,
                    ),
                    SizedBox(height: 15,),
                    _buildDateField(),
                    SizedBox(height: 15,),
                    Container(
                      padding: EdgeInsets.all(25.0),
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white,width: 2),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: DropdownButton<String>(
                        hint: Text(
                          "District",
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                          ),
                        ),
                        value: districtInput,
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.add),
                        iconSize: 26,
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
                            child: Text(value),
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
                      padding: EdgeInsets.all(25.0),
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white,width: 2),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: DropdownButton<String>(
                        hint: Text(
                          "Thana",
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                          ),
                        ),
                        value: thanaInput,
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.add),
                        iconSize: 26,
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
                            child: Text(value),
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
              onPressed: _proceed,
              child: Text('Proceed to Physical Info'),
            )
          ],
        ),
      ),
    );
  }
}
