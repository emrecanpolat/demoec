import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'instructor_dashboard_view_model.dart';

class InstructorDashboardScreen extends StatelessWidget {
  const InstructorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<InstructorDashboardViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Instructor Dashboard'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: vm.hasAssignment
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Live Lesson Request',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Text(
              'You have been assigned a new live lesson request.',
            ),
          ],
        )
            : const Center(
          child: Text(
            'No active live lesson requests',
          ),
        ),
      ),
    );
  }
}
