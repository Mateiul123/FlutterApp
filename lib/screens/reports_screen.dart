import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text(
          'Reports will be displayed here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
