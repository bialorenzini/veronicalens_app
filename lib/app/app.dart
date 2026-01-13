import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/auth/viewmodels/auth_view_model.dart';
import 'auth_notifier.dart';
import 'router.dart';

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
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      routerConfig: router,
    );
  }
}
