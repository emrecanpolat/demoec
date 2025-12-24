import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/courses/course_list_view_model.dart';
import '../ui/matching/live_lesson_view_model.dart';
import '../ui/purchased_courses_view_model/purchased_courses_view_model.dart';
import 'app_router.dart';
import 'di/di_config.dart';
import '../ui/splash/splash_view_model.dart';
import '../ui/login/login_view_model.dart';
import '../ui/payment/payment_view_model.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => getIt<SplashViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<LoginViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<CourseListViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<PaymentViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<LiveLessonViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<PurchasedCoursesViewModel>(),
        ),




      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mini Udemy Uber Demo',
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: AppRouter.splash,
      ),
    );
  }
}
