import '../entities/payment_result.dart';
import '../entities/course_entity.dart';

abstract class PaymentRepository {
  Future<PaymentResult> purchaseCourse(CourseEntity course);
}
