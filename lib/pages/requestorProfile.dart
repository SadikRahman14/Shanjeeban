import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RequestorProfile extends StatefulWidget {
  @override
  _RequestorProfileState createState() => _RequestorProfileState();
}

class _RequestorProfileState extends State<RequestorProfile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*Future<void> getUserData() async {
      try {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection("userCredentials").doc(docID).get();
        if (userSnapshot.exists) {
          String userName = userSnapshot['name'];
          String userhandle = userSnapshot['handle'];
          String userbloodGroup = userSnapshot['bloodGroup'];
          String userdistrict = userSnapshot['district'];
          String userthana = userSnapshot['thana'];


          setState(() {
            name = userName;
            handle = userhandle;
            bloodGroup = userbloodGroup;
            district = userdistrict;
            thana = userthana;
          });

          // print('User Name: $userName');
          // print('age: $age');
          // print('User district: $district');
          // print('User thana: $thana');
          // print('User phone: $phone');
        } else {
          print('User does not exist');
        }
      } catch (e) {
        print('Error fetching user data: $e');
      }
    }

    Future<void> getUserData() async {
      try {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection("userIdHolder").doc(uid).get();
        if (userSnapshot.exists) {
          String docID = userSnapshot['email'];



          setState(() {
            docId = docID;
          });

          // print('User Name: $userName');
          // print('age: $age');
          // print('User district: $district');
          // print('User thana: $thana');
          // print('User phone: $phone');
        } else {
          print('User does not exist');
        }
      } catch (e) {
        print('Error fetching user data: $e');
      }
    }*/
    final Map<String, dynamic> formData = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String docId = formData['docId'];
    String requestorUid = formData['requestorUid'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Requestor  Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Requestor UID: $requestorUid'),
            Text('Doc ID: $docId'),

          ],
        ),
      ),
    );
  }
}
