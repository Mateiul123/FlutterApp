import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> productData;

  const ProductDetailsScreen({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    final managementName = productData['management']['name'];
    final productName = productData['product']['name'];
    final initialCount = productData['initialProductCount'];
    final changedCount = productData['changedProductCount'];
    final stockPrice = productData['stockPrice'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Management Name: $managementName',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Product Name: $productName',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Initial Product Count: $initialCount',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Changed Product Count: $changedCount',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Stock Price: \$${stockPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
