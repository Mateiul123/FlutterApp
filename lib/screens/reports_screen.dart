import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports Screen'),
      ),
      body: Center(
        child: Text(
          'Inventory Reports Screen',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
