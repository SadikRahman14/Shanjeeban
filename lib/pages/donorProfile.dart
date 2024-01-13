import 'package:flutter/material.dart';

class donorProfile extends StatefulWidget {
  const donorProfile({super.key});

  @override
  State<donorProfile> createState() => _donorProfileState();
}

class _donorProfileState extends State<donorProfile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> formData = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String docId = formData['docId'];
    String donorUid = formData['donorUid'];

    return Scaffold(
      appBar: AppBar(
        title: Text('donor Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Requestor UID: $donorUid'),
            Text('Doc ID: $docId'),

          ],
        ),
      ),
    );
  }
}
