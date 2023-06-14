import 'package:beefit/auth.dart';
import 'package:beefit/pages/home_page.dart';
import 'package:beefit/login.dart';
import 'package:beefit/profile.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ProfilePage(
            age: 25,
            height: 30,
            email: 'johndoe@gmail.com',
            name: 'John',
            gender: 'Male',
            photoUrl: '',
            weight: 12,
          );
        } else {
          return LoginPage();
        }
      },
    );
  }
}
