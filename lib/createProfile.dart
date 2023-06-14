import 'package:flutter/material.dart';
import 'package:beefit/profile.dart';
import 'package:mysql1/mysql1.dart';
import 'package:beefit/signup.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({super.key});

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  Widget inputBox(String text) {
    return Padding(
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
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: text,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    void pressbutton() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const SignUpPage()), //////////////////////// DEĞİŞTİR
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
                Text('Enter Your Profile Details',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 58,
                    )),
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
                //name field
                inputBox("name"),
                SizedBox(height: 20),
//email field
                inputBox("age"),
//confirm email field
                SizedBox(
                  height: 20,
                ),
                inputBox("height"),
                SizedBox(
                  height: 20,
                ),
//password field

//confirm password field
                inputBox("weight"),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ElevatedButton(
                      onPressed: pressbutton,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                      ),
                      child: const Text('SignUp')),
                ),
              ],
            ),
          ),
        ));
  }
}
