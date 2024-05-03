import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScannerPage extends StatefulWidget {
  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  String _scanResult = 'No data yet'; // Variable to store scanned barcode data

  Future<void> _scanBarcode() async {
    String barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666', // Optional: Color of the scan button
      'Cancel', // Optional: Text for the cancel button
      true, // Optional: Whether to show the flash icon
      ScanMode.BARCODE, // Optional: Specify the scan mode (barcode, QR code, etc.)
    );

    if (!mounted) return;

    setState(() {
      _scanResult = barcodeScanResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Barcode Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _scanBarcode,
              child: Text('Scan Barcode'),
            ),
            SizedBox(height: 20),
            Text(
              'Scan Result: $_scanResult',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
