import 'package:flutter/material.dart';
import '../../domain/entities/course_entity.dart';
import '../../domain/usecases/purchase_course_usecase.dart';
import '../../domain/usecases/get_purchased_courses_usecase.dart';

class PaymentViewModel extends ChangeNotifier {
  final PurchaseCourseUseCase purchaseCourseUseCase;
  final GetPurchasedCoursesUseCase getPurchasedCoursesUseCase;

  PaymentViewModel(
      this.purchaseCourseUseCase,
      this.getPurchasedCoursesUseCase,
      );

  bool isLoading = false;
  String? message;

  Future<bool> pay(CourseEntity course) async {
    if (isLoading) return false;

    isLoading = true;
    message = null;
    notifyListeners();

    final result = await purchaseCourseUseCase(course);

    if (result.success) {
      getPurchasedCoursesUseCase.addCourse(course);
    }

    isLoading = false;
    message = result.message;
    notifyListeners();

    return result.success;
  }

  void reset() {
    isLoading = false;
    message = null;
    notifyListeners();
  }
}
