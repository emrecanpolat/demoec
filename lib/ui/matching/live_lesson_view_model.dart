import 'package:flutter/material.dart';
import '../../domain/entities/instructor_entity.dart';
import '../../domain/usecases/request_live_lesson_usecase.dart';

class LiveLessonViewModel extends ChangeNotifier {
  final RequestLiveLessonUseCase requestLiveLessonUseCase;

  LiveLessonViewModel(this.requestLiveLessonUseCase);

  bool isLoading = false;
  InstructorEntity? matchedInstructor;

  Future<void> requestLesson() async {
    if (isLoading) return;

    isLoading = true;
    matchedInstructor = null;
    notifyListeners();

    matchedInstructor = await requestLiveLessonUseCase();

    isLoading = false;
    notifyListeners();
  }

  void reset() {
    isLoading = false;
    matchedInstructor = null;
    notifyListeners();
  }
}
