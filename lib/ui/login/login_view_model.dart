import 'package:flutter/material.dart';
import '../../app/app_router.dart';
import '../../core/enums/user_role.dart';

class LoginViewModel extends ChangeNotifier {
  void login(BuildContext context, UserRole role) {
    switch (role) {
      case UserRole.user:
        Navigator.pushNamed(context, AppRouter.userDashboard);
        break;
      case UserRole.instructor:
        Navigator.pushNamed(context, AppRouter.instructorDashboard);
        break;
      case UserRole.admin:
        Navigator.pushNamed(context, AppRouter.adminDashboard);
        break;
    }
  }
}
