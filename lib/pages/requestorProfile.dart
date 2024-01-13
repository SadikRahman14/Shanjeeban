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

    final Map<String, dynamic> formData = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String docId = formData['docId'];
    String requestorUid = formData['donorUid'];

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
