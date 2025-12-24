import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'live_lesson_view_model.dart';

class LiveLessonScreen extends StatefulWidget {
  const LiveLessonScreen({super.key});

  @override
  State<LiveLessonScreen> createState() => _LiveLessonScreenState();
}

class _LiveLessonScreenState extends State<LiveLessonScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LiveLessonViewModel>().reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LiveLessonViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Live Lesson')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Request a live lesson and we will assign an instructor.',
            ),
            const SizedBox(height: 24),

            if (vm.isLoading)
              const CircularProgressIndicator()
            else
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: vm.requestLesson,
                  child: const Text('Request Live Lesson'),
                ),
              ),

            if (vm.matchedInstructor != null) ...[
              const SizedBox(height: 24),
              Text(
                'Assigned Instructor:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(vm.matchedInstructor!.name),
            ],
          ],
        ),
      ),
    );
  }
}
