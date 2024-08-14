import 'package:flutter/material.dart';
import 'package:harmoniz/core/theme/theme.dart';
import 'package:harmoniz/features/auth/view/pages/signup_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: const SignupPages(),
    );
  }
}
