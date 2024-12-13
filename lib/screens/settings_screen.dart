import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text(
          'Settings options will be displayed here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
