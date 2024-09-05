import 'package:flutter/material.dart';
import 'GlobalAppImage.dart';
import 'GlobalColors.dart';
import 'GlobalFunction.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Profile',
          style: TextStyle(color: GlobalAppColor.WhiteColorCode),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: GlobalFunction.ProfileDetails.isNotEmpty
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          GlobalAppImage.NetworkImage,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Name'),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      initialValue: GlobalFunction.ProfileDetails[0],
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Age'),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      initialValue: GlobalFunction.ProfileDetails[1],
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Age',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Sex'),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      initialValue: GlobalFunction.ProfileDetails[2],
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Sex',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Address'),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      initialValue: GlobalFunction.ProfileDetails[3],
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Address',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16), // Added space
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Pin Code'),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      initialValue: GlobalFunction.ProfileDetails[4],
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Pincode',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: Text(
                'Please Complete the Registration.',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
    );
  }
}
