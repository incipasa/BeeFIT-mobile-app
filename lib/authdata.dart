/*
import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cloud SQL Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Authenticated client
  late http.Client client;

  @override
  void initState() {
    super.initState();
    // Authenticate the app
    _authenticate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Cloud SQL Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: _getInstances,
                child: Text('Get Instances'),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Instance Name',
                  ),
                  // Save the name in a variable
                  onChanged: (value) => _instanceName = value,
                ),
                ElevatedButton(
                  onPressed: _createInstance,
                  child: Text('Create Instance'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Authenticate the app
  _authenticate() async {
    // Load the private key file
    final key = json.decode(await File('/bright-feat-372314-411fc9fbf492.json').readAsString());
    final clientEmail = key['client_email'];
    final privateKey = key['private_key'];

    // Authenticate the app with the service account
    final googleAuth = await clientViaServiceAccount(
      ServiceAccountCredentials.fromJson(key),
      ['https://www.googleapis.com/auth/sqlservice.admin'],
    );

    // Save the authenticated client
    setState(() {
      client = googleAuth.client;
    });
  }

  // Get a list of Cloud SQL instances
  _getInstances() async {
    // Send a GET request to the `sql.instances.list` endpoint
    final response = await client.get(
      'https://www.googleapis.com/sql/v1beta4/projects/<your-project-id>/instances',
    );

    // Print the response body
    print(response.body);
  }

  // Create a new Cloud SQL instance
  _createInstance() async {
    // Set the request body
    final body = {
      'name': _instanceName,
      '
      'region': 'us-central1',
      'databaseVersion': 'MYSQL_5_7',
      'settings': {
        'tier': 'db-f1-micro',
      },
    };

    // Send a POST request to the `sql.instances.insert` endpoint
    final response = await client.post(
      'https://www.googleapis.com/sql/v1beta4/projects/<your-project-id>/instances',
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(body),
    );

    // Print the response body
    print(response.body);
  }
}

*/