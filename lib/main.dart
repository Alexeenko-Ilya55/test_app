import 'package:flutter/material.dart';
import 'package:test_app/app.dart';
import 'core/di/app_module.dart' as di;

void main() async {
  di.init();

  runApp(const TestApp());
}