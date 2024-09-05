import 'package:flutter/material.dart';
import 'package:validationpage/GlobalComponents/GlobalAppImage.dart';
import 'package:validationpage/GlobalComponents/GlobalColors.dart';
import 'package:validationpage/GlobalComponents/Sidedrawer.dart';

class WelcomeScreen extends StatefulWidget {
  final String email;
  final String name;

  WelcomeScreen({super.key, required this.email, required this.name});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    print(
        "WelcomeScreen received email: ${widget.email} and name: ${widget.name}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Home',
            style: TextStyle(color: GlobalAppColor.WhiteColorCode)),
        iconTheme: IconThemeData(color: GlobalAppColor.WhiteColorCode),
      ),
      drawer: Sidedrawer(
        names: widget.name,
        emails: widget.email,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(
                GlobalAppImage.NetworkImage,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Hi ${widget.email}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'Welcome to IBAP Technologies',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
