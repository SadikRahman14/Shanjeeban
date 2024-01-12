import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class RequestorList extends StatefulWidget {
  @override
  _RequestorListState createState() => _RequestorListState();
}

class _RequestorListState extends State<RequestorList> {
  CollectionReference bloodRequests =
  FirebaseFirestore.instance.collection('A-');
  void getSpecificCollection() {
    bloodRequests = FirebaseFirestore.instance.collection(bloodGroup);
  }

  // Function to handle the click event
  void onPersonClicked(String name) {
    // Add your navigation logic here
    print('Clicked on $name');
    print(bloodGroup);
    print(" ");
    print(" ");
    // Navigate to the user's profile page or perform any other action
  }

  String docID = "gg";
  String bloodGroup = "nothing";

  Future<void> getUserData() async {
    try {
      DocumentSnapshot userSnapshot3 =
      await FirebaseFirestore.instance.collection("userCredentials").doc(docID).get();
      if (userSnapshot3.exists) {
        final newBloodGroup = userSnapshot3['bloodGroup'];
        if (newBloodGroup != bloodGroup) {
          setState(() {
            bloodGroup = newBloodGroup;
          });
        }
      } else {
        print('User does not exist');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      final Map<String, dynamic>? args =
      ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      if (args != null && args.containsKey('docID')) {
        docID = args['docID'];

        getUserData();
      }
    } finally {
      print(bloodGroup);
      print("aaa ");
      print("aaa ");
      bloodRequests = FirebaseFirestore.instance.collection(bloodGroup);

      return Scaffold(
        appBar: AppBar(
          title: Text('Blood Donation Page'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: bloodRequests.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            var documents = snapshot.data!.docs;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Available Requests:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                // Display each document's info in a clickable box
                for (var document in documents)
                  InkWell(
                    onTap: () {
                      // Call the callback function with the person's name
                      onPersonClicked(document['reason']);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name: ${document['reason']}'),
                          Text('Bags Needed: ${document['quantity']}'),
                          Text('Hospital: ${document['hospital']}'),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      );
    }
  }
}