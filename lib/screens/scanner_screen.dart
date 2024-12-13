import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'product_details_screen.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scanner (Testing)'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Simulated Barcode',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // Display the barcode image
          Image.asset(
            'assets/barcode.jpg',
            width: 300,
            height: 100,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              const String simulatedBarcode = '978156592764'; // Replace with your test barcode value
              String? response = await _fetchProductData(simulatedBarcode);

              if (response != null) {
                // Parse the response JSON
                Map<String, dynamic> productData = jsonDecode(response);

                // Navigate to ProductDetailsScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                      productData: productData,
                    ),
                  ),
                );
              } else {
                // Show an error message
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    title: Text('Error'),
                    content: Text('Failed to fetch product details.'),
                  ),
                );
              }
            },
            child: const Text('Simulate Scan'),
          ),
        ],
      ),
    );
  }

  // Function to perform the GET request
  Future<String?> _fetchProductData(String barcode) async {
    const String baseUrl = 'http://localhost:8000/api/stock';
    final Uri url = Uri.parse('$baseUrl/$barcode');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return response.body; // Return the response body if successful
      } else {
        return null; // Return null for non-200 responses
      }
    } catch (e) {
      return null; // Return null if an error occurs
    }
  }
}
