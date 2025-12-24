import '../entities/course_entity.dart';
import '../entities/payment_result.dart';
import '../repositories/payment_repository.dart';

class PurchaseCourseUseCase {
  final PaymentRepository repository;

  PurchaseCourseUseCase(this.repository);

  Future<PaymentResult> call(CourseEntity course) {
    return repository.purchaseCourse(course);
  }
}
