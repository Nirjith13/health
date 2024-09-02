// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Change to relevant data
  TextEditingController _nameController = TextEditingController(text: 'Dr. Jane Smith');
  TextEditingController _emailController = TextEditingController(text: 'jane.smith@healthcare.com');
  TextEditingController _phoneController = TextEditingController(text: '+9876543210');
  TextEditingController _specializationController = TextEditingController(text: 'Cardiologist');
  TextEditingController _licenseController = TextEditingController(text: 'License #123456');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Information', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent, // Healthcare themed color
        elevation: 4,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)], // Healthcare-themed gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            _buildProfilePicture(),
            SizedBox(height: 20),
            _buildProfileDetails(),
            SizedBox(height: 20),
            _buildEditableProfileSection(
              title: 'Personal Details',
              items: [
                _buildEditableProfileItem(controller: _nameController, label: 'Name'),
                _buildEditableProfileItem(controller: _emailController, label: 'Email'),
                _buildEditableProfileItem(controller: _phoneController, label: 'Phone'),
              ],
            ),
            SizedBox(height: 20),
            _buildEditableProfileSection(
              title: 'Professional Details',
              items: [
                _buildEditableProfileItem(controller: _specializationController, label: 'Specialization'),
                _buildEditableProfileItem(controller: _licenseController, label: 'License Number'),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the previous page
                },
                child: Text('Back'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Consistent theme color
                  disabledBackgroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/profile_placeholder.png'), // Update with a professional image
            backgroundColor: Colors.grey[200],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              icon: Icon(Icons.camera_alt, color: Colors.blueAccent),
              onPressed: () {
                // Handle profile picture upload
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Dr. Jane Smith', // Replace with dynamic data
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 8),
        Text(
          'Cardiologist', // Replace with dynamic data
          style: TextStyle(color: Colors.grey[700], fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildEditableProfileSection({required String title, required List<Widget> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 10),
        ...items,
      ],
    );
  }

  Widget _buildEditableProfileItem({required TextEditingController controller, required String label}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        title: Text(label, style: TextStyle(color: Colors.black)),
        subtitle: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: label,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
      ),
    );
  }
}
