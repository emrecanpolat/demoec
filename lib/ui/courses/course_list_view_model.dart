import 'package:flutter/material.dart';
import '../../domain/entities/course_entity.dart';
import '../../domain/usecases/get_courses_usecase.dart';

class CourseListViewModel extends ChangeNotifier {
  final GetCoursesUseCase getCoursesUseCase;

  CourseListViewModel(this.getCoursesUseCase);

  List<CourseEntity> courses = [];
  bool isLoading = false;

  Future<void> loadCourses() async {
    isLoading = true;
    notifyListeners();

    courses = await getCoursesUseCase();

    isLoading = false;
    notifyListeners();
  }
}
