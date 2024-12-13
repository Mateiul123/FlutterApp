import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scanner'),
        backgroundColor: Colors.blueAccent,
      ),
      body: MobileScanner(
        onDetect: (BarcodeCapture capture) {
          // Retrieve all detected barcodes
          final List<Barcode> barcodes = capture.barcodes;
          if (barcodes.isNotEmpty) {
            final String code = barcodes.first.rawValue ?? 'Unknown';
            // Display the scanned barcode value
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Barcode Found'),
                content: Text('Value: $code'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
