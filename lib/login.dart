import 'package:beefit/signup.dart';

import 'package:beefit/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:beefit/profile.dart';
import 'package:http/http.dart' as http;

import 'auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    void goToSignUpPage() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpPage()),
      );
    }

    void goToProfile() {
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
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 231, 242, 229),
        // ignore: prefer_const_literals_to_create_immutables
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  height: 60,
                ),

                SizedBox(
                  height: 10,
                ), // For space between
                Text('Welcome to',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 58,
                        fontFamily: 'RobotoMono')),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/bee.jpg',
                        width: 80,
                        height: 80,
                      ),
                      Text('Fit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 58,
                          )),
                    ],
                  ),
                ),

                SizedBox(
                  height: 50,
                ),
                //email field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                Container(
                  child: ElevatedButton(
                      onPressed:
                          //signInWithEmailAndPassword, // firebase sign in call
                          goToProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                      ),
                      child: const Text('Sign In/Go profile')),
                ),
                SizedBox(
                  height: 25,
                ),

                //password textfield
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  // ignore: prefer_const_literals_to_create_immutables

                  children: [
                    Text(
                      'Not a member?',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                InkWell(
                  onTap: goToSignUpPage,
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.blue),
                  ),
                  highlightColor: Colors.green,
                  splashColor: Colors.green,
                )
                // not a member? register
              ],
            ),
          ),
        ));
  }
}
