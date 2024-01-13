import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login/deGea/signUpInfo.dart';
import 'package:login/rakibul/loginPage.dart';
import 'package:login/pages/fromNavigationBar/NotificationPage.dart';
import 'package:login/pages/fromNavigationBar/historyPage.dart';

class RequestorList extends StatefulWidget {
  @override
  _RequestorListState createState() => _RequestorListState();
}

class _RequestorListState extends State<RequestorList> {

  String docId = "ff";
  String name = "naam";
  String uid = "uid";

  Future<void> getUserData() async {
    try {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection("userCredentials").doc(docID).get();
      if (userSnapshot.exists) {
        String userName = userSnapshot['name'];



        setState(() {
          name = userName;

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

  Future<void> getDocId() async {
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
  }

  CollectionReference bloodRequests =
  FirebaseFirestore.instance.collection('A-');
  void getSpecificCollection() {
    bloodRequests = FirebaseFirestore.instance.collection(bloodGroup);
  }

  void onPersonClicked(String requestorUid) {
    print('Clicked on $requestorUid');
    print(bloodGroup);
    print(" ");
    print(" ");

    Navigator.pushNamed(
      context, '/requestedProfile',
      arguments: {
        'requestorUid' : requestorUid,
        'docId' : docID,
      },
    );
  }

  String docID = "gg";
  String bloodGroup = "nothing";


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
                for (var document in documents)
                  //uid = document['uid'],
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
                          DonateNowList(title: 'ss', onPress: () {
                            onPersonClicked(document['uid']);
                          },
                              subtitle: '${document['hospital']}', sub_subtitle: '${document['quantity']}'),

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

class DonateNowList extends StatefulWidget {
  const DonateNowList({
    Key? key,
    required this.title, required this.onPress, required this.subtitle, required this.sub_subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String sub_subtitle;
  final VoidCallback onPress;

  @override
  State<DonateNowList> createState() => _DonateNowListState();
}

class _DonateNowListState extends State<DonateNowList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Color(0xFFADC4C1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Color(0xFF900000),
          width: 2.0,
        ),
      ),
      child: ListTile(

        onTap: widget.onPress,
        leading: Container(

          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color(0xFFADC4C1),
          ),
          child: ClipOval(
            child: Image(
              height: 50, width: 50,
              image: AssetImage(
                'assetsSadik/Profile.jpg',
              ),
            ),
          ),
        ),
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Classy',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                widget.subtitle,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontFamily: 'Classy',
                  fontSize: 10,
                ),
              ),
              Text(
                widget.sub_subtitle,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontFamily: 'Classy',
                  fontSize: 10,
                ),
              ),
            ]
        ),


        trailing: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white.withOpacity(0.3),
          ),
          child: Icon(
            LineAwesomeIcons.angle_right,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}