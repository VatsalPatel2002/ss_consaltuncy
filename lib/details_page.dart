import 'package:flutter/material.dart';

import 'home_screen.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Text('Details Page'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          // Handle navigation based on selected index
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (index == 1) {
            // Navigate to Details page
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => DetailsPage()),
            // );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake),
            label: 'Agreements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Details',
          ),
        ],
      ),
    );
  }
}