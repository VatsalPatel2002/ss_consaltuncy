// Import necessary Flutter packages
import 'package:flutter/material.dart';
import 'package:ss_consultancy/upload_page.dart';

import 'details_page.dart';
import 'new_agreement_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewAgreementPage()),
                    );
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.description,
                        size: 50,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'New Agreement',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UploadPage()),
                    );
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.cloud_upload,
                        size: 50,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Upload',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          // Handle navigation based on selected index
          if (index == 0) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomeScreen()),
            // );
          } else if (index == 1) {
            // Navigate to Details page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailsPage()),
            );
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