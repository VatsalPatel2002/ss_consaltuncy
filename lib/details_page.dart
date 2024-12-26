import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'S', // First letter "S" in red
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red, // Red color for first letter
                ),
                children: [
                  TextSpan(
                    text: 'HIVSHAKTI ', // Remaining part in white
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White color for the rest
                    ),
                  ),
                  TextSpan(
                    text: 'C', // First letter "C" in red
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Red color for "C"
                    ),
                  ),
                  TextSpan(
                    text: 'ONSULTANCY', // Remaining part in white
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White color for the rest
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Agreement',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.monetization_on,
                      size: 50,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Loan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.verified,
                      size: 50,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Insurance',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          if (index == 0) {
            Navigator.pop(context); // Return to the previous screen
          } else if (index == 1) {
            // Already on Details Page
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