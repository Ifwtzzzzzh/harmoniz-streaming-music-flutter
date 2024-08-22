import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmoniz/core/providers/current_user_notifier.dart';
import 'package:harmoniz/core/theme/theme.dart';
import 'package:harmoniz/features/auth/view/pages/signup_pages.dart';
import 'package:harmoniz/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:harmoniz/features/home/view/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  await container.read(authViewmodelProvider.notifier).initSharedPreferences();
  await container.read(authViewmodelProvider.notifier).getData();
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserNotifierProvider);
    return MaterialApp(
      title: 'Harmoniz - Streaming Music App',
      theme: AppTheme.darkThemeMode,
      home: currentUser == null ? const SignupPages() : const HomePage(),
    );
  }
}
