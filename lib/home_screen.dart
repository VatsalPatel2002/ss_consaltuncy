// Import necessary Flutter packages
import 'package:flutter/material.dart';

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
            Text(
              'SHIVSHAKTI CONSULTANCY',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
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
                Column(
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
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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

class NewAgreementPage extends StatefulWidget {
  @override
  _NewAgreementPageState createState() => _NewAgreementPageState();
}

class _NewAgreementPageState extends State<NewAgreementPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  String? _selectedLoanType;
  List<String> loanTypes = ['Home', 'Car', 'Personal', 'Education'];

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Agreement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'SHIVSHAKTI CONSULTANCY',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text(
                  _selectedDate == null
                      ? 'Select Date'
                      : 'Date: ${_selectedDate!.toLocal()}'.split(' ')[0],
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(Icons.calendar_today, color: Colors.white),
                onTap: () => _selectDate(context),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedLoanType,
                decoration: InputDecoration(
                  labelText: 'Loan Type',
                  border: OutlineInputBorder(),
                ),
                items: loanTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedLoanType = newValue;
                  });
                },
                validator: (value) =>
                value == null ? 'Please select a loan type' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Submit form logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Form Submitted')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
