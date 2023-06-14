import 'package:beefit/inputs.dart';
import 'package:beefit/feedback.dart';
import 'package:flutter/material.dart';
import 'package:beefit/food.dart';

import 'auth.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  final String email;
  final int age;
  final double height;
  final double weight;
  final String photoUrl;

  const ProfilePage({
    Key? key,
    required this.name,
    required this.email,
    required this.age,
    required this.height,
    required this.weight,
    required this.photoUrl,
    required String gender,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState(
        name: name,
        email: email,
        age: age,
        height: height,
        weight: weight,
        photoUrl: photoUrl,
      );
}

class _ProfilePageState extends State<ProfilePage> {
  final String name;
  final String email;
  final int age;
  final double height;
  final double weight;
  final String photoUrl;
  int _selectedIndex = 0;

  _ProfilePageState({
    required this.name,
    required this.email,
    required this.age,
    required this.height,
    required this.weight,
    required this.photoUrl,
  });

  void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfilePage(
                      name: 'John Doe',
                      email: 'john@example.com',
                      age: 30,
                      height: 75,
                      gender: 'Male',
                      weight: 75,
                      photoUrl:
                          'https://this-person-does-not-exist.com/img/avatar-dd367695480fd226ae1eda9e00fe8400.jpg',
                    )),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FoodPage()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FeedbackPage()),
          );
          break;
      }
      _selectedIndex = index;
    });
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }
/*
  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //_signOutButton(),
          Container(
            height: 300,
            color: Colors.grey[200],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://this-person-does-not-exist.com/img/avatar-dd367695480fd226ae1eda9e00fe8400.jpgs'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Age'),
            trailing: Text(age.toString()),
          ),
          ListTile(
            leading: Icon(Icons.accessibility),
            title: Text('Height'),
            trailing: Text('$height cm'),
          ),
          ListTile(
            leading: Icon(Icons.line_weight),
            title: Text('Weight'),
            trailing: Text('$weight kg'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Food/Exercise',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Feedback',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
