import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PDFPreviewPage extends StatelessWidget {
  final Map<String, String> formData;

  PDFPreviewPage({required this.formData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
        centerTitle: true,
      ),
      body: PdfPreview(
        build: (format) async => _generatePDF(format, formData),
        allowSharing: true,
        allowPrinting: true,
        pdfFileName: 'agreement.pdf',
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () async {
                await Printing.layoutPdf(
                  onLayout: (format) async => _generatePDF(format, formData),
                );
              },
              child: Text('Print'),
            ),
            ElevatedButton(
              onPressed: () async {
                await Printing.sharePdf(
                  bytes: await _generatePDF(PdfPageFormat.a4, formData),
                  filename: 'agreement.pdf',
                );
              },
              child: Text('Download'),
            ),
          ],
        ),
      ),
    );
  }
  Future<Uint8List> _generatePDF(PdfPageFormat format, Map<String, String> data) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(20),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                  child: pw.Text(
                    'SHIVSHAKTI CONSULTANCY',
                    style: pw.TextStyle(
                      fontSize: 20,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Table(
                  border: pw.TableBorder.all(),
                  columnWidths: {
                    0: const pw.FixedColumnWidth(150),
                    1: const pw.FlexColumnWidth(),
                  },
                  children: [
                    _buildTableRow('Name', data['Name'] ?? ''),
                    _buildTableRow('Mobile Number', data['Mobile Number'] ?? ''),
                    _buildTableRow('Aadhar Card Number', data['Aadhar Card Number'] ?? ''),
                    _buildTableRow('PAN Card Number', data['PAN Card Number'] ?? ''),
                    _buildTableRow('Loan Amount', data['Loan Amount'] ?? ''),
                    _buildTableRow('Amount Credited into Account', data['Amount Credited'] ?? ''),
                    _buildTableRow('Loan Portal', data['Loan Portal'] ?? ''), // Add Loan Portal
                    _buildTableRow('Bank Charges', data['Bank Charges'] ?? ''),
                    _buildTableRow('Installment', data['Installment'] ?? ''),
                    _buildTableRow('Number of Installments', data['Number of Installments'] ?? ''),
                    _buildTableRow('Date of First Installment', data['Date of First Installment'] ?? ''),
                    _buildTableRow('Consultancy Charges', data['Consultancy Charges'] ?? ''),
                    _buildTableRow('Date', data['Date'] ?? ''),

                  ],
                ),
              ],
            ),
          );
        },
      ),
    );

    return pdf.save();
  }

  pw.TableRow _buildTableRow(String label, String value) {
    return pw.TableRow(
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.all(8.0),
          child: pw.Text(label, style:  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.all(8.0),
          child: pw.Text(value),
        ),
      ],
    );
  }
}
