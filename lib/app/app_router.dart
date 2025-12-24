import 'package:flutter/material.dart';

import '../domain/entities/course_entity.dart';
import '../ui/courses/course_list_screen.dart';
import '../ui/matching/live_lesson_view_model.dart';
import '../ui/purchased_courses_view_model/purchased_courses_screen.dart';
import '../ui/splash/splash_screen.dart';
import '../ui/login/login_screen.dart';
import '../ui/user_dashboard/user_dashboard_screen.dart';
import '../ui/instructor/instructor_dashboard_screen.dart';
import '../ui/admin/admin_screen.dart';
import '../ui/payment/payment_screen.dart';
import '../ui/matching/live_lesson_screen.dart';
import 'package:provider/provider.dart';
import 'di/di_config.dart';
import '../ui/instructor/instructor_dashboard_view_model.dart';



class AppRouter {
  static const splash = '/';
  static const login = '/login';
  static const userDashboard = '/user';
  static const instructorDashboard = '/instructor';
  static const adminDashboard = '/admin';
  static const courses = '/courses';
  static const payment = '/payment';
  static const liveLesson = '/live-lesson';
  static const purchasedCourses = '/purchased-courses';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case courses:
        return MaterialPageRoute(builder: (_) => const CourseListScreen());
      case payment:
        final course = settings.arguments as CourseEntity;
        return MaterialPageRoute(
          builder: (_) => PaymentScreen(course: course),
        );
      case liveLesson:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => getIt<LiveLessonViewModel>(),
            child: const LiveLessonScreen(),
          ),
        );


      case userDashboard:
        return MaterialPageRoute(builder: (_) => const UserDashboardScreen());
      case instructorDashboard:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => getIt<InstructorDashboardViewModel>(),
            child: const InstructorDashboardScreen(),
          ),
        );

      case adminDashboard:
        return MaterialPageRoute(builder: (_) => const AdminScreen());
      case purchasedCourses:
        return MaterialPageRoute(
          builder: (_) => const PurchasedCoursesScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }
}
