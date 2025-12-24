import 'package:flutter/material.dart';
import '../../app/app_router.dart';

class SplashViewModel extends ChangeNotifier {
  Future<void> init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));

    Navigator.pushReplacementNamed(context, AppRouter.login);
  }
}
