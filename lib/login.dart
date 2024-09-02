// ignore_for_file: unused_import, must_be_immutable, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hems/MongoDBModel.dart';
import 'package:hems/dbHelper/mongodb.dart';

class HealthcareLoginPage extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(167, 127, 99, 203), 
                Colors.white,  
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
              _loginButton(context),
              _signup(context),
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
          "Welcome Back",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          "Enter your credentials to login",
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
            prefixIcon: Icon(
              Icons.email,
              color: Colors.black,
              size: 24.0,
            ),
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
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.black,
              size: 24.0,
            ),
          ),
          obscureText: true,
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _loginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/dashboard');
      },
      child: Text(
        "Login",
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(), backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 17),
      ),
    );
  }

  Widget _signup(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.black),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/signup');
          },
          child: Text(
            "Sign Up",
            style: TextStyle(color: Colors.deepPurple),
          ),
        ),
      ],
    );
  }

  /*Future<bool> _loginUser(BuildContext context, String email, String password) async {
    try {
      // Fetch the user data from MongoDB
      var user = await MongoDatabase.getUser(email, password);

      if (user != null && user.password == password) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successful")));
        return true;
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid credentials")));
        return false;
      }
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("An error occurred")));
      return false;
    }
  }*/
}
