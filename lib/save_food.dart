import 'package:flutter/material.dart';
import 'package:beefit/feedback.dart';
import 'package:beefit/profile.dart';
import 'package:beefit/exercise.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  // get whta user typed
  final _textController = TextEditingController();
  //String stToInt = '';
  int userPost = 0;
  var _categoryVal;
  List _categoryName = [
    'Fruit',
    'Vegetables',
    'Meat',
    'Junk Food',
    'Bakery',
  ];
  var _nameVal;
  List _name2 = [
    'Red Meat                               2030 kcal/kg',
    'Chicken                                  2390 kcal/kg',
    'Fish                                         2058 kcal/kg',
    'Turkey                                     1888 kcal/kg',
  ];
  List _name = [
    'Red Meat                               2030 kcal/kg',
    'Chicken                                  2390 kcal/kg',
    'Fish                                         2058 kcal/kg',
    'Turkey                                     1888 kcal/kg',
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FoodPage()),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExercisePage()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FeedbackPage()),
          );
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfilePage(
                      name: 'John Doe',
                      email: 'john@example.com',
                      age: 30,
                      gender: 'Male',
                      height: 75,
                      weight: 75,
                      photoUrl:
                          'https://this-person-does-not-exist.com/img/avatar-796f2700adb942342f62c69e9aff949a.jpg',
                    )),
          );
          break;
      }
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              Text('Enter Your Food Information',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  )),
              SizedBox(
                height: 50,
              ),
              //food name field
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
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text("Select a category"),
                      value: _categoryVal,
                      onChanged: (value) {
                        setState(() {
                          _categoryVal = value;
                        });
                      },
                      items: _categoryName.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
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
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text("Select a name"),
                      value: _nameVal,
                      onChanged: (_value) {
                        setState(() {
                          _nameVal = _value;
                          if (_categoryVal == 'Meat') {
                            _name.add('newMeat');
                          }
                        });
                      },
                      items: _name.map((_value) {
                        return DropdownMenuItem(
                          value: _value,
                          child: Text(_value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //calories field
              /*Padding(
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
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Select Name',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),*/
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
                      keyboardType: TextInputType.number,
                      controller: _textController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Amount (g)',
                      ),
                    ),
                  ),
                ),
              ),

              //calories field
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 15,
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    /*if (_nameVal == 'Red Meat') {
                      userPost = int.parse(_textController.text) * 30;
                    } else if (_nameVal ==
                        'Chicken                                  2390 kcal/kg') {
                      userPost =
                          (int.parse(_textController.text) * 0.2390) as int;
                    } else if (_nameVal ==
                        'Fish                                         2058 kcal/kg') {
                      userPost =
                          (int.parse(_textController.text) * 0.2058) as int;
                    } else if (_nameVal ==
                        'Turkey                                     1888 kcal/kg') {
                      userPost =
                          (int.parse(_textController.text) * 0.1888) as int;
                    }*/
                    //userPost = _textController.value as int;

                    //userPost = int.parse(_textController.text) * 10;
                    if (_nameVal == 'Red Meat') {
                      userPost = int.parse(_textController.text) * 30;
                    }
                  });
                },
                color: Colors.purple,
                child: const Text("Calculate",
                    style: TextStyle(color: Colors.white)),
              ),
              SizedBox(
                height: 15,
              ),
              /*Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Total calories burnt: ',
                      semanticsLabel: "$userPost",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                ),*/
              Row(
                children: [
                  Expanded(
                      child: Container(
                          child: Center(
                    child: Text('Total calories taken: ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                  ))),
                  Expanded(
                      child: Container(
                          child: Center(
                              child: Text("$userPost" "  kcal",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 35))))),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Food',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Exercise',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Feedback',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.grey,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
