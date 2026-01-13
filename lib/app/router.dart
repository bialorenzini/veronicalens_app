import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'auth_notifier.dart';
import '../features/auth/views/login_page.dart';
import '../features/home/views/home_page.dart';

GoRouter createRouter(AuthNotifier authNotifier) {
  return GoRouter(
    initialLocation: '/login',
    refreshListenable: authNotifier,

    redirect: (context, state) {
      final loggedIn = authNotifier.isLoggedIn;
      final isLoggingIn = state.matchedLocation == '/login';

      if (!loggedIn && !isLoggingIn) {
        return '/login';
      }

      if (loggedIn && isLoggingIn) {
        return '/home';
      }

      return null;
    },

    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
