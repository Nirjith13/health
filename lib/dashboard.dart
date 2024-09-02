

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthcare Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
          children: [
            _buildDashboardItem(
              context,
              icon: Icons.bloodtype,
              label: 'Blood Donation',
              onTap: () {
                Navigator.pushNamed(context, '/bloodDonation');
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.biotech,
              label: 'Lab Results',
              onTap: () {
                Navigator.pushNamed(context, '/labResults');
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.restaurant,
              label: 'Diet Chart',
              onTap: () {
                Navigator.pushNamed(context, '/dietChart');
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.health_and_safety,
              label: 'Health Tips',
              onTap: () {
                Navigator.pushNamed(context, '/healthTips');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48.0,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 8.0),
            Text(
              label,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
