import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class donorList extends StatefulWidget {
  const donorList({super.key});

  @override
  State<donorList> createState() => _donorListState();
}

class _donorListState extends State<donorList> {
  CollectionReference bloodRequests =
  FirebaseFirestore.instance.collection('A-');

  void onPersonClicked(String donorId) {
    print(" ");
    print("checking here: ");
    print('Clicked on ' + donorId);
    print(docID);
    print(" ");
    print(" ");

    Navigator.pushNamed(
      context, '/donorProfile',
      arguments: {
        'donorUid': donorId,
        'docId': docID,
      },
    );

  }

  String docID = "gg";
  String requiredBlood = "gg";
  String bloodGroup = "nothing";

  // Future<void> getUserData() async {
  //   try {
  //     DocumentSnapshot userSnapshot3 =
  //     await FirebaseFirestore.instance.collection("newUserCredentials").doc(docID).get();
  //     if (userSnapshot3.exists) {
  //       final newBloodGroup = userSnapshot3['bloodGroup'];
  //       if (newBloodGroup != bloodGroup) {
  //         setState(() {
  //           bloodGroup = newBloodGroup;
  //         });
  //       }
  //     } else {
  //       print('User does not exist');
  //     }
  //   } catch (e) {
  //     print('Error fetching user data: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    try {
      final Map<String, dynamic>? args =
      ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      if (args != null && args.containsKey('docID')) {
        docID = args['docID'];
        requiredBlood = args['blood'];

        // getUserData();
      }
    } finally {
      print(bloodGroup);
      print("aaa ");
      print("aaa ");
      String req = requiredBlood + "donor";
      bloodRequests = FirebaseFirestore.instance.collection(req);

      return Scaffold(
        appBar: AppBar(
          title: Text('DONORS LIST'),
        ),
        body: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
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
                    'Available Donors:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  for (var document in documents)
                    InkWell(
                      onTap: () {
                        onPersonClicked(document['uid']);
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
                            Text('Name: ${document['thana']}'),
                            Text('Bags Needed: ${document['district']}'),
                            Text('UID: ${document['uid']}'),
                            Text('name: ${document['name']}'),
                            Text('phone: ${document['phone']}'),
                            Text('email: ${document['email']}'),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      );
    }
  }
}
