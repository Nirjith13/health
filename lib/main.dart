

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hems/dashboard.dart';
import 'package:hems/dbHelper/mongodb.dart';
import 'package:hems/login.dart';
import 'package:hems/profile.dart';
import 'package:hems/signup.dart';  // Assuming this file contains the signup page

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(HealthcareApp());
}

// ignore: use_key_in_widget_constructors
class HealthcareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthcare Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HealthcareSignupPage(),
        '/dashboard': (context) => DashboardPage(),
        '/login': (context) => HealthcareLoginPage(), 
        '/signup': (context) => HealthcareSignupPage(), 
        '/profile':(context)=> ProfilePage(),
      },
    );
  }
}




