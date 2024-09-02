// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
//import 'package:hems/dietChart.dart'; // Import the DietChartPage here

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildFullBackground(),
          Column(
            children: [
              SizedBox(height: 60), // Space for the AppBar area
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProminentFeatureSection(),
                      _buildScrollableFeatureList(),
                      SizedBox(height: 20),
                      _buildAdditionalInfoSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
        },
        backgroundColor: Colors.teal,
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildFullBackground() {
    return Positioned.fill(
      child: Image.asset(
        'assets/hc4.webp', // Ensure this path is correct
        fit: BoxFit.cover,
        color: Colors.black.withOpacity(0.3), // Reduce intensity of the background
        colorBlendMode: BlendMode.darken,
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: BottomNavigationBar(
        backgroundColor: Colors.teal.withOpacity(0.8), // Set background color for BottomNavigationBar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildProminentFeatureSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.teal.shade700.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Consult a Doctor',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Icon(Icons.medical_services, color: Colors.white, size: 30),
        ],
      ),
    );
  }

  Widget _buildScrollableFeatureList() {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: complexDashboardItems.map((item) {
          return _buildHorizontalItem(context, item);
        }).toList(),
      ),
    );
  }

  Widget _buildHorizontalItem(BuildContext context, ComplexDashboardItem item) {
    return GestureDetector(
      onTap: () => item.onTap(context),
      child: Container(
        width: 160,
        margin: EdgeInsets.only(left: 16.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: item.colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 4,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, size: 40.0, color: Colors.white),
            SizedBox(height: 10.0),
            Text(
              item.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditionalInfoSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Additional Features',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Explore more features and stay updated with your health status.',
            style: TextStyle(fontSize: 14.0, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}

class ComplexDashboardItem {
  final IconData icon;
  final String label;
  final void Function(BuildContext) onTap;
  final List<Color> colors;

  ComplexDashboardItem({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.colors,
  });
}

final List<ComplexDashboardItem> complexDashboardItems = [
  ComplexDashboardItem(
    icon: Icons.bloodtype,
    label: 'Blood Donation',
    onTap: (context) {
      // Handle navigation
    },
    colors: [Colors.red.shade800, Colors.red.shade400],
  ),
  ComplexDashboardItem(
    icon: Icons.biotech,
    label: 'Lab Results',
    onTap: (context) {
      // Handle navigation
    },
    colors: [Colors.blue.shade700, Colors.blue.shade400],
  ),
  ComplexDashboardItem(
    icon: Icons.restaurant,
    label: 'Diet Chart',
    onTap: (context) {
      /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DietChartPage()),
      );*/
    },
    colors: [Colors.green.shade700, Colors.green.shade400],
  ),
  ComplexDashboardItem(
    icon: Icons.health_and_safety,
    label: 'Doctor Consultancy',
    onTap: (context) {
      // Handle navigation
    },
    colors: [Colors.orange.shade700, Colors.orange.shade400],
  ),
];
