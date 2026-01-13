import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/auth_view_model.dart';
import 'views/login_page.dart';
import 'views/home/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final authVM = context.watch<AuthViewModel>();

    if (authVM.currentUser == null) {
      return const LoginPage();
    } else {
      return const HomePage();
    }
  }
}
