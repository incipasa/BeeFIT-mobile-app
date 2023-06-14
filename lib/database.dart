/*
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MySQL Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Connection object
  late MySqlConnection conn;

  // List of users
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    // Connect to the database
    _connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter MySQL Example'),
      ),
      body: Column(
        children: [
          // Display a list of users
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index]['name']),
                  subtitle: Text(users[index]['email']),
                );
              },
            ),
          ),
          // Add a new user form
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                  ),
                  // Save the name in a variable
                  onChanged: (value) => _name = value,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  // Save the email in a variable
                  onChanged: (value) => _email = value,
                ),
                RaisedButton(
                  onPressed: _addUser,
                  child: Text('Add User'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Connect to the database
  _connect() async {
    // Connect to the database
    conn = await MySqlConnection.connect(ConnectionSettings(
      host: '<your-instance-ip-address>',
      port: 3306,
      user: '<your-username>',
      password: '<your-password>',
      db: '<your-database>',
    ));

    // Retrievethe list of users
    _getUsers();
  }

// Retrieve the list of users
  _getUsers() async {
// Execute a SELECT statement
    var results = await conn.query('SELECT * FROM users');
// Convert the results to a list of maps
    users = results.toList();

// Refresh the widget
    setState(() {});
  }

// Add a new user
  _addUser() async {
// Execute an INSERT statement
    await conn.query('INSERT INTO users (name, email) VALUES (?, ?)',
        [_name, _email]); // Retrieve the updated list of users
    _getUsers();
  }
}

*/