import '../../domain/entities/course_entity.dart';
import '../../domain/entities/payment_result.dart';
import '../../domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  @override
  Future<PaymentResult> purchaseCourse(CourseEntity course) async {
    await Future.delayed(const Duration(seconds: 1));

    return PaymentResult(
      success: true,
      message: 'Payment successful',
    );
  }
}
