// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_new, must_be_immutable, unused_element, unused_import, library_prefixes, unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, deprecated_member_use, use_build_context_synchronously, annotate_overrides

import 'package:flutter/material.dart';
import 'package:hems/MongoDBModel.dart';
import 'package:hems/dbHelper/mongodb.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class HealthcareSignupPage extends StatelessWidget {
  var fullnameController = new TextEditingController();
  var emailController = new TextEditingController();
  var passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,  // Ensure the gradient covers the entire screen width
          height: double.infinity, // Ensure the gradient covers the entire screen height
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [ 
                Color.fromARGB(167, 127, 99, 203), // Violet color
                Colors.white,             // White color
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
              _signupButton(context),
              _login(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      children: [
        Text(
          "Join Healthcare",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Text color set to black
          ),
        ),
        Text(
          "Enter your details to create an account",
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }

  Widget _inputField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          key: Key('full_name_field'),
          controller: fullnameController,
          decoration: InputDecoration(
            hintText: "Full Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(
              Icons.person,
              color: Colors.black,  // Make sure the color is visible
              size: 24.0,  // Adjust size if necessary
            ),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          key: Key('email_field'),
          controller: emailController,
          decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.email),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          key: Key('password_field'),
          controller: passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _signupButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // Connect to MongoDB
        await MongoDatabase.connect();
        
        // Insert data
        await _insertData(context, fullnameController.text, emailController.text, passwordController.text);

        // Navigate to dashboard
        Navigator.pushNamed(context, '/dashboard');
      },
      child: Text(
        "Create Account",
        style: TextStyle(
          fontSize: 20,
          color: Colors.black, // Button text color set to black
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(), backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 17), // Button background color set to white
      ),
    );
  }

  Widget _login(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already a member?",
          style: TextStyle(color: Colors.black),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: Text(
            "Login",
            style: TextStyle(color: Colors.deepPurple),
          ),
        ),
      ],
    );
  }

  Future<void> _insertData(BuildContext context, String fullName, String email, String password) async {
    var _id = M.ObjectId();
    final data = MongoDbModel(
        id: _id, fullName: fullName, email: email, password: password);
    var result = await MongoDatabase.insert(data);
    
    // Show Snackbar
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
    
    _clearAll();
  }

  void _clearAll() {
    fullnameController.text = "";
    emailController.text = "";
    passwordController.text = "";
  }
}
