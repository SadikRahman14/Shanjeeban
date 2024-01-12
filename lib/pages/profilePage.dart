import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String docID = "ggh";
  String ?name;
  String ?handle;
  String ?bloodGroup;
  String ?thana;
  String ?district;

  void logout() async{
    await FirebaseAuth.instance.signOut();
    print(" ");print(" ");print(" ");
    print("going to sadik's page");
    print(" ");print(" ");print(" ");
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushNamed(context, '/loginPage');
  }

  Future<void> getUserData() async {
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

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    docID = args['docID'];
    getUserData();

    return Scaffold(
      backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pushNamed(
                  context, '/homePage',
                  arguments: {
                    'docID' : docID,
                  }
              );
            },
            icon: Icon(LineAwesomeIcons.angle_left),
          ),
          centerTitle: true,
          title: Text(
              'Profile',
          ),


        ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              padding: EdgeInsets.only(
                left: 12, right: 12, top: 12,
              ),

              height: 400, width: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(26),
                  bottomRight: Radius.circular(26),
                ),

              ),
              child: Column(

                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 4,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        image: AssetImage('assetsSadik/Profile.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    '$name' ?? 'Loading...',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Classy',

                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    '$handle' ?? 'Loading...',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 10,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'Classy',
                    ),
                  ),
                  SizedBox(height: 3,),
                  Container(
                    width: 200,  // Set the desired width
                    child: Divider(
                      height: 20,

                    ),
                  ),
                  SizedBox(height: 3,),
                  SizedBox(height: 10,),
                  Text(
                    'Blood Group: ' '$bloodGroup' ?? '',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF900000),
                      //fontWeight: FontWeight.w600,
                      fontFamily: 'Classy',
                    ),
                  ),





                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        LineAwesomeIcons.map_marker,
                        size: 15,
                      ),
                      Text(
                        '$thana, ' ' $district',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF900090),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Elegant',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20,),

            ProfileTiles(
                title: "Settings", icon: LineAwesomeIcons.cog, onPress: (){},
                endIcon: true, containerColor: Colors.grey[100]
            ),
            SizedBox(height: 20,),
            ProfileTiles(
                title: "Edit Profile", icon: LineAwesomeIcons.edit, onPress: (){},
                endIcon: true, containerColor: Colors.grey[100]
            ),
            SizedBox(height: 20,),
            ProfileTiles(
                title: "Settings", icon: LineAwesomeIcons.cog, onPress: (){},
                endIcon: true, containerColor: Colors.grey[100]
            ),
            SizedBox(height: 20,),
            ProfileTiles(
                title: "Log Out", icon: LineAwesomeIcons.power_off, onPress: (){ logout();
            },
              endIcon: true, textColor: Colors.white, containerColor: Colors.red, leadingIconColor: Colors.white,
            ),
            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}

class ProfileTiles extends StatelessWidget {
  const ProfileTiles({
    super.key, required this.title, required this.icon, required this.onPress, required this.endIcon, this.textColor, this.containerColor, this.leadingIconColor,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;
  final Color? containerColor;
  final Color? leadingIconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        onTap: onPress,
        //tileColor: Colors.white,
        leading: Container(
          width: 40, height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color:  Colors.grey.withOpacity(0.1),
          ),
          child: Icon(
              icon,
              color: leadingIconColor ?? Colors.grey,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontFamily: 'Classy',
          ),

        ),
        trailing: endIcon? Container(
          width: 30, height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: Icon(
            LineAwesomeIcons.angle_right,
            color: Colors.grey,
          ),
        ) : null,
      ),
    );
  }
}
