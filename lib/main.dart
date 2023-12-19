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

class _ProductDetailsPageState extends State<ProductDetailsPage>{
  var fullNameInput = TextEditingController();
  var passwordInput = TextEditingController();
  var phoneNumberInput = TextEditingController();
  var handleInput = TextEditingController();
  var emailInput = TextEditingController();
  DateTime? selectedDate;
  var districtInput = TextEditingController();
  var thanaInput = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? _validateInput(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String fieldName,
    required TextInputType keyboardType,
    bool obscureText = false,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          label : Row(
            mainAxisSize: MainAxisSize.min,
              children: [
                if (labelText == "Full Name")
                  Icon(Icons.account_box, size: 24,)
                else if (labelText == "Password")
                  Icon(Icons.key, size: 24,)
                else if (labelText == "Phone Number")
                  Icon(Icons.phone, size: 24,)
                else if (labelText == "Handle")
                  Icon(Icons.supervisor_account, size: 24,)
                else if (labelText == "Email")
                  Icon(Icons.email, size: 24,)
                else if (labelText == "District")
                  Icon(Icons.location_on, size: 24,)
                else if (labelText == "Thana")
                  Icon(Icons.add_location, size: 24,),
                Text(" $labelText"),
              ],
          ),
          labelStyle: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w600,
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
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2.5,
            ),
          ),
          errorStyle: TextStyle(color: Colors.red),
        ),
        validator: (value) => _validateInput(value, fieldName),
      ),
    );
  }

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
                fontSize: 24,
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
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Container(
              width: 320,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 68,),
                  _buildTextField(
                    controller: fullNameInput,
                    labelText: 'Full Name',
                    fieldName: 'Full Name',
                    keyboardType: TextInputType.text,
                  ),
                  _buildTextField(
                    controller: passwordInput,
                    labelText: 'Password',
                    fieldName: 'Password',
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                  _buildTextField(
                    controller: phoneNumberInput,
                    labelText: 'Phone Number',
                    fieldName: 'Phone Number',
                    keyboardType: TextInputType.phone,
                  ),
                  _buildTextField(
                    controller: handleInput,
                    labelText: 'Handle',
                    fieldName: 'Handle',
                    keyboardType: TextInputType.text,
                  ),
                  _buildTextField(
                    controller: emailInput,
                    labelText: 'Email',
                    fieldName: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 8,),
                  _buildDateField(),
                  SizedBox(height: 8,),
                  _buildTextField(
                    controller: districtInput,
                    labelText: 'District',
                    fieldName: 'District',
                    keyboardType: TextInputType.text,
                  ),
                  _buildTextField(
                    controller: thanaInput,
                    labelText: 'Thana',
                    fieldName: 'Thana',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 18,),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
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
                      }
                    },
                    child: Text('Proceed to Physical Info'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
