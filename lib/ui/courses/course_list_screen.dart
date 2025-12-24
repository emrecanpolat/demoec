import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/app_router.dart';
import 'course_list_view_model.dart';
import 'widgets/course_card.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CourseListViewModel>().loadCourses();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CourseListViewModel>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        centerTitle: true,
      ),
      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: vm.courses.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final course = vm.courses[index];
            return CourseCard(
              course: course,
              onBuy: () {
                Navigator.pushNamed(
                  context,
                  AppRouter.payment,
                  arguments: course,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
