import 'package:flutter/material.dart';
import 'GlobalAppImage.dart';
import 'userdetails.dart';
import 'profile.dart';

class Sidedrawer extends StatefulWidget {
  String? names;
  String? emails;

  Sidedrawer({super.key, required this.names, required this.emails});

  @override
  State<Sidedrawer> createState() => _SidedrawerState();
}

class _SidedrawerState extends State<Sidedrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(widget.names!),
            accountEmail: Text(widget.emails!),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                GlobalAppImage.NetworkImage,
              ),
              backgroundColor: Colors.white,
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
          ListTile(
            leading: Icon(Icons.app_registration),
            title: Text('Register'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserDetails()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: Text('Projects'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
