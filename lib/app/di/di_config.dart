import 'package:get_it/get_it.dart';
import '../../data/repositories/course_repository_impl.dart';
import '../../data/repositories/payment_repository_impl.dart';
import '../../data/repositories/matching_repository_impl.dart';
import '../../domain/repositories/course_repository.dart';
import '../../domain/repositories/payment_repository.dart';
import '../../domain/repositories/matching_repository.dart';
import '../../domain/usecases/get_courses_usecase.dart';
import '../../domain/usecases/get_purchased_courses_usecase.dart';
import '../../domain/usecases/purchase_course_usecase.dart';
import '../../domain/usecases/request_live_lesson_usecase.dart';
import '../../ui/splash/splash_view_model.dart';
import '../../ui/login/login_view_model.dart';
import '../../ui/courses/course_list_view_model.dart';
import '../../ui/payment/payment_view_model.dart';
import '../../ui/matching/live_lesson_view_model.dart';
import '../../ui/instructor/instructor_dashboard_view_model.dart';
import '../../ui/purchased_courses_view_model/purchased_courses_view_model.dart';

final GetIt getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton<CourseRepository>(
        () => CourseRepositoryImpl(),
  );

  getIt.registerLazySingleton<PaymentRepository>(
        () => PaymentRepositoryImpl(),
  );

  getIt.registerLazySingleton<MatchingRepository>(
        () => MatchingRepositoryImpl(),
  );

  getIt.registerLazySingleton(
        () => GetCoursesUseCase(getIt<CourseRepository>()),
  );

  getIt.registerLazySingleton(
        () => GetPurchasedCoursesUseCase(),
  );

  getIt.registerLazySingleton(
        () => PurchaseCourseUseCase(getIt<PaymentRepository>()),
  );

  getIt.registerLazySingleton(
        () => RequestLiveLessonUseCase(getIt<MatchingRepository>()),
  );

  getIt.registerFactory(() => SplashViewModel());

  getIt.registerFactory(() => LoginViewModel());

  getIt.registerFactory(
        () => CourseListViewModel(
      getIt<GetCoursesUseCase>(),
    ),
  );

  getIt.registerFactory(
        () => PaymentViewModel(
      getIt<PurchaseCourseUseCase>(),
      getIt<GetPurchasedCoursesUseCase>(),
    ),
  );

  getIt.registerFactory(
        () => PurchasedCoursesViewModel(
      getIt<GetPurchasedCoursesUseCase>(),
    ),
  );

  getIt.registerFactory(
        () => LiveLessonViewModel(
      getIt<RequestLiveLessonUseCase>(),
    ),
  );

  getIt.registerFactory(
        () => InstructorDashboardViewModel(
      getIt<RequestLiveLessonUseCase>(),
    ),
  );
}
