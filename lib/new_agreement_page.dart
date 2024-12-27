import 'package:flutter/material.dart';
import 'package:ss_consultancy/pdf_preview_page.dart';

import 'details_page.dart';
import 'home_screen.dart';

class NewAgreementPage extends StatefulWidget {
  const NewAgreementPage({super.key});

  @override
  _NewAgreementPageState createState() => _NewAgreementPageState();
}

class _NewAgreementPageState extends State<NewAgreementPage> {
  // Create a TextEditingController for the date field
  TextEditingController _dateController = TextEditingController();

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Set initial date to today's date
      firstDate: DateTime(2000), // Set a first allowed date (optional)
      lastDate: DateTime(2101), // Set a last allowed date (optional)
    );

    // If a date is selected, update the TextEditingController with the selected date
    if (selectedDate != null) {
      setState(() {
        _dateController.text = "${selectedDate.toLocal()}".split(' ')[0]; // Format the date to YYYY-MM-DD
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Agreement'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Picker TextField
            TextField(
              controller: _dateController, // Use the controller here
              decoration: InputDecoration(
                labelText: 'Date',
                suffixIcon: Icon(Icons.calendar_today), // Add calendar icon
              ),
              readOnly: true, // Make the field read-only
              onTap: () {
                // Trigger date picker when the field is tapped
                _selectDate(context);
              },
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Mobile Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              items: ['Loan Type 1', 'Loan Type 2', 'Loan Type 3']
                  .map((type) => DropdownMenuItem(
                value: type,
                child: Text(type),
              ))
                  .toList(),
              decoration: InputDecoration(labelText: 'Loan Type'),
              onChanged: (value) {},
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Loan Portal'),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Loan Amount'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Amount Credited into Account'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Bank Charges'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Installment'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Number of Installments'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Date of First Installment'),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Aadhar Card Number'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'PAN Card Number'),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Consultancy Charges'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Map<String, String> dummyData = {
                    'Date': '2024-12-25',
                    'Mobile Number': '9876543210',
                    'Name': 'John Doe',
                    'Loan Type': 'Personal Loan',
                    'Loan Portal': 'Bank XYZ',
                    'Loan Amount': '500000',
                    'Amount Credited': '490000',
                    'Bank Charges': '10000',
                    'Installment': '10000',
                    'Number of Installments': '50',
                    'Date of First Installment': '2025-01-01',
                    'Aadhar Card Number': '1234-5678-9101',
                    'PAN Card Number': 'ABCDE1234F',
                    'Consultancy Charges': '5000',
                  };
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PDFPreviewPage(formData: dummyData,)),
                  );
                  // Handle form submission
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
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