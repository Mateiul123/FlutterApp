import 'package:flutter/material.dart';
import 'scanner_screen.dart';
import 'manual_entry_screen.dart'; // New screen for manual entry
import 'reports_screen.dart';
import 'settings_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.deepPurple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // App Logo or Hero Image
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.store,
                          size: 50,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Gestiunea Stocului',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Cards Section
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Button 1: Scan Barcode
                        _buildDashboardCard(
                          context,
                          icon: Icons.qr_code_scanner,
                          title: 'Scaneaza Codul De Bare',
                          color: Colors.blue.shade700,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ScannerScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),

                        // Button 2: Enter Manually
                        _buildDashboardCard(
                          context,
                          icon: Icons.keyboard,
                          title: 'Introdu Codul Sau Numele',
                          color: Colors.purple.shade600,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ManualEntryScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),

                        // Button 3: View Reports
                        _buildDashboardCard(
                          context,
                          icon: Icons.bar_chart,
                          title: 'Rapoarte',
                          color: Colors.green.shade600,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ReportsScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),

                        // Button 4: Settings
                        _buildDashboardCard(
                          context,
                          icon: Icons.settings,
                          title: 'Setari',
                          color: Colors.orange.shade800,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingsScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // Footer Section
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Center(
                    child: Text(
                      'App Version 1.0.0',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required Color color,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: color,
                radius: 30,
                child: Icon(icon, size: 30, color: Colors.white),
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
