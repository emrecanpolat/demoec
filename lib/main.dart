import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/di/di_config.dart';

void main() {
  setupDI();
  runApp(const MyApp());
}
