import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Panel')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'This is a mock admin panel.\n\n'
              'In a real system, admin users would manage courses, users, '
              'payments, and platform settings here.',
        ),
      ),
    );
  }
}
