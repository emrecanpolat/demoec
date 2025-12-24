import 'package:flutter/material.dart';
import '../../domain/entities/instructor_entity.dart';
import '../../domain/usecases/request_live_lesson_usecase.dart';

class InstructorDashboardViewModel extends ChangeNotifier {
  final RequestLiveLessonUseCase requestLiveLessonUseCase;

  InstructorDashboardViewModel(this.requestLiveLessonUseCase);

  bool get hasAssignment =>
      requestLiveLessonUseCase.lastAssignedInstructor != null;

  InstructorEntity? get assignedInstructor =>
      requestLiveLessonUseCase.lastAssignedInstructor;
}
