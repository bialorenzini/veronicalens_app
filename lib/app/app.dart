import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/auth/viewmodels/auth_view_model.dart';
import 'auth_notifier.dart';
import 'router.dart';
import '../core/constants/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authVM = context.watch<AuthViewModel>();
    final authNotifier = AuthNotifier(authVM);

    final router = createRouter(authNotifier);

    

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Veronica Lens',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Syne',
        colorSchemeSeed: AppColors.primary,
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
