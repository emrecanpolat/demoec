import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'purchased_courses_view_model.dart';

class PurchasedCoursesScreen extends StatelessWidget {
  const PurchasedCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PurchasedCoursesViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Purchased Courses')),
      body: vm.courses.isEmpty
          ? const Center(child: Text('No purchased courses yet'))
          : ListView.builder(
        itemCount: vm.courses.length,
        itemBuilder: (context, index) {
          final course = vm.courses[index];
          return ListTile(
            title: Text(course.title),
            subtitle: Text(course.instructorName),
          );
        },
      ),
    );
  }
}
