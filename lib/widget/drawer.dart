// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, non_constant_identifier_names, prefer_initializing_formals

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  String? Name;
  String? Email;

  MyDrawer(String Name, String Email) {
    this.Name = Name;
    this.Email = Email;
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  accountName: Text(Name.toString()),
                  accountEmail: Text(Email.toString()),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/profile_picture.png"),
                  )),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white),
              title: Text(
                "Home",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            ListTile(
              leading:
                  Icon(CupertinoIcons.profile_circled, color: Colors.white),
              title: Text(
                "Profile",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
