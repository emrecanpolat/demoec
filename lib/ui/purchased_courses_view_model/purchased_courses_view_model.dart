import 'package:flutter/material.dart';
import '../../domain/entities/course_entity.dart';
import '../../domain/usecases/get_purchased_courses_usecase.dart';

class PurchasedCoursesViewModel extends ChangeNotifier {
  final GetPurchasedCoursesUseCase getPurchasedCoursesUseCase;

  PurchasedCoursesViewModel(this.getPurchasedCoursesUseCase);

  List<CourseEntity> get courses =>
      getPurchasedCoursesUseCase.getPurchasedCourses();
}
