import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'auth_notifier.dart';
import '../features/auth/views/login_page.dart';
import '../features/auth/views/register_page.dart';
import '../features/home/views/home_page.dart';
import '../features/ar/views/ar_page.dart';
import '../features/camera/views/camera_page.dart';
import '../features/settings/views/settings_page.dart';

GoRouter createRouter(AuthNotifier authNotifier) {
  return GoRouter(
    initialLocation: '/login',
    refreshListenable: authNotifier,

    redirect: (context, state) {
      final loggedIn = authNotifier.isLoggedIn;
      final isLogin = state.matchedLocation == '/login';
      final isRegister = state.matchedLocation == '/register';

      if (!loggedIn && !(isLogin || isRegister)) {
        return '/login';
      }

      if (loggedIn && (isLogin || isRegister)) {
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
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/ar',
        builder: (context, state) => const ARPage(),
      ),
      GoRoute(
        path: '/camera',
        builder: (context, state) => const CameraPage(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
}