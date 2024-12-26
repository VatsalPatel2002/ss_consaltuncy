import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 40),
            Text(
              'Loan or Insurance Policy',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              items: ['Loan', 'Insurance']
                  .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
                  .toList(),
              onChanged: (value) {
                // Handle selection change
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Loan Type (All)',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'If Insurance (Two Wheel/Four Wheel/Other)',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              items: ['Two Wheel', 'Four Wheel', 'Other']
                  .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
                  .toList(),
              onChanged: (value) {
                // Handle selection change
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Insurance Type',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select File',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                // Open file picker
                FilePickerResult? result = await FilePicker.platform.pickFiles();

                if (result != null) {
                  // Get the file path
                  String? filePath = result.files.single.path;

                  if (filePath != null) {
                    // Handle the selected file (e.g., display file path or process the file)
                    print('Selected file: $filePath');
                  }
                } else {
                  // User canceled the file picker
                  print('No file selected');
                }
              },
              child: Text('Select File'),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement upload logic
                },
                child: Text('Upload'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
