import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login/deGea/signUpInfo.dart';
import 'package:login/rakibul/loginPage.dart';
import 'package:login/pages/fromNavigationBar/NotificationPage.dart';
import 'package:login/pages/fromNavigationBar/historyPage.dart';


class BloodRequestForm extends StatefulWidget {
  @override
  _BloodRequestFormState createState() => _BloodRequestFormState();
}

class _BloodRequestFormState extends State<BloodRequestForm> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedBloodGroup;
  String? _currentAddress;
  int? _quantity;
  String? _selectedReason;
  String? _selectedHospital;

  List<String> _bloodGroups = ['A+', 'A-', 'B+','B-', 'AB+','AB-', 'O+','O-'];
  List<String> _transfusionReasons = [
    'Autoimmune Disorders',
    'Blood Disorders',
    'Bone Marrow Diseases',
    'Cancer Treatment',
    'Genetic Disorders',
    'Infections',
    'Liver Diseases',
    'Loss of Blood',
    'Medical Conditions Affecting Blood Production',
    'Surgery',
  ];
  List<String> _hospitalNames = [
    'Aalok Healthcare & Hospital Ltd.',
    'Al Razi Hospital',
    'Al- Helal Specialized Hospital Limited',
    'Anwer Khan Modern Hospital Limited',
    'Apollo Hospitals Dhaka',
    'Asgar Ali Hospital',
    'Bangladesh Eye Hospital',
    'Bangladesh Specialized Hospital',
    'Banani Clinic Limited (Specialized Hospital)',
    'BRB Hospitals Limited',
    'Care Medical College & Hospital',
    'Central Hospital Cox\'s Bazar (Near Girls School)',
    'Central Hospital Limited',
    'City Hospital Ltd.',
    'Cure Medical Center',
    'Delta Hospital Limited',
    'Digital Hospital Cox\'s Bazar Pvt. Ltd.',
    'Dhaka City Physiotherapy Hospital',
    'Epic Health Care Limited',
    'Farazy Hospital Limited',
    'Green Life Hospital',
    'Hi-care General Hospital',
    'HITECH Multicare Hospital Ltd.',
    'Holy Family Red Crescent Medical College Hospital',
    'Ibn Sina',
    'Ibn Sina Medical College Hospital',
    'Ibn Sina Specialized Hospital',
    'Impulse Hospital Limited',
    'Insaf Barakah Kidney & General Hospital',
    'Islami Bank Central Hospital',
    'Islami Bank Hospital Mirpur',
    'Islami Bank Hospital Mugda',
    'Islami Bank Hospital Motijheel',
    'Islami Bank Specialized & General Hospital Nayapalton',
    'Japan Bangladesh Friendship Hospital',
    'Kingston Hospital Limited',
    'Labaid Cardiac Hospital',
    'Labaid Group',
    'Labaid Specialized Hospital',
    'Life Care Medical Center',
    'Lubana General Hospital (Pvt.) Limited',
    'Max Hospital Limited',
    'MH Samorita Hospital and Medical College-Tejgoan',
    'Monowara Hospital (Pvt.) Ltd',
    'Praava Health',
    'Prescription Point Limited',
    'Prescription Point Limited (Badda Branch)',
    'Prescription Point Limited (Specialized Clinic)',
    'Rifat\'s Dental',
    'Salauddin Medical College',
    'Samorita Hospital Limited',
    'Sheikh Fazilatunnesa KPJ',
    'SIBL Foundation Hospital',
    'Surecell Medical Service (BD) Ltd.',
    'Thyrocare',
    'Uttara Crescent Hospital',
    'United Hospitals Limited',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD4E3E1),
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
              Navigator.pop(context);
          },
          icon: Icon(LineAwesomeIcons.angle_left),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFADC4C1),
        title: Text('Blood Donation Form'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),

            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        'REQUEST FOR BLOOD',
                        style: TextStyle(
                          fontFamily: 'Classy',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF900000),
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 25,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: DropdownButtonFormField(
                          value: _selectedBloodGroup,
                          items: _bloodGroups.map((group) {
                            return DropdownMenuItem(
                              value: group,
                              child: Text(group),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedBloodGroup = value as String?;
                            });
                          },
                          icon: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Icon(Icons.arrow_drop_down,
                                color: Colors.black,
                              )
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFADC4C1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 10.0,
                              )
                            ),
                            labelText: 'Blood Group',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Classy',
                            ),
                            prefixIcon: Icon(
                              Icons.bloodtype,
                              color: Colors.red[900],
                            ),

                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a blood group';
                            }
                            return null;
                          },
                        ),

                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: DropdownButtonFormField(
                          value: _selectedReason,
                          items: _transfusionReasons.map((reason) {
                            return DropdownMenuItem(

                              value: reason,
                              child: Text(reason),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedReason = value as String?;
                            });
                          },
                          icon: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(100),
                            ),
                              child: Icon(Icons.arrow_drop_down,
                                color: Colors.black,
                              )
                          ),
                          decoration: InputDecoration(

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Color(0xFFADC4C1),
                            labelText: 'Reason for Blood Transfusion',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Classy',
                            ),
                            prefixIcon: Icon(
                              Icons.error,
                              color: Colors.red[900],
                            ),

                          ),
                          isExpanded: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a reason for blood transfusion';
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: DropdownButtonFormField(
                          value: _selectedHospital,
                          items: _hospitalNames.map((hospital) {
                            return DropdownMenuItem(
                              value: hospital,
                              child: Text(hospital),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedHospital = value as String?;
                            });
                          },
                          icon: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Icon(Icons.arrow_drop_down,
                                color: Colors.black,
                              )
                          ),
                          decoration: InputDecoration(

                            filled: true,
                            fillColor: Color(0xFFADC4C1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 10.0,
                              ),
                            ),
                            labelText: 'Hospital Name',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Classy',
                            ),
                            prefixIcon: Icon(Icons.local_hospital_sharp,
                              color: Colors.red[900],
                            ),


                          ),

                          isExpanded: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a hospital';
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFADC4C1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            labelText: 'Quantity',
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Classy',
                              ),
                            prefixIcon: Icon(
                              Icons.numbers_sharp,
                              color: Colors.red[900],
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a quantity';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Please enter a valid number';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _quantity = int.tryParse(value ?? ''); // Provide a default value if value is null
                          },


                        ),
                      ),
                      SizedBox(height: 25.0),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF900000)),
                          elevation: MaterialStateProperty.all<double>(10.0),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            // Process the form data
                            // For example, you can print the values:
                            print('Blood Group: $_selectedBloodGroup');
                            print('Reason for Transfusion: $_selectedReason');
                            print('Current Address: $_selectedHospital');
                            print('Quantity: $_quantity');

                            Navigator.pushNamed(context, '/donatorsList');
                          }
                        },
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Classy',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
