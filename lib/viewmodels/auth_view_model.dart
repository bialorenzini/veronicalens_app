import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/services/firebase_auth_service.dart';
import '../../../core/services/user_service.dart';

class AuthViewModel extends ChangeNotifier {
  final FirebaseAuthService _authService;
  final UserService _userService = UserService();
  AuthViewModel(this._authService);

  bool isLoading = false;
  String? errorMessage;

  User? get currentUser => _authService.currentUser;


Future<void> loginWithEmail(String email, String password) async {
  isLoading = true;
  notifyListeners();

  try {
    final user = await _authService.signInWithEmail(
      email: email,
      password: password,
    );

    if (user != null) {
      await _userService.createUserIfNotExists(user);
    }

    errorMessage = null;
  } catch (e) {
    errorMessage = e.toString();
  } finally {
    isLoading = false;
    notifyListeners();
  }
}


Future<void> registerWithEmail(String email, String password) async {
  isLoading = true;
  notifyListeners();

  try {
    final user = await _authService.registerWithEmail(
      email: email,
      password: password,
    );

    if (user != null) {
      await _userService.createUserIfNotExists(user);
    }

    errorMessage = null;
  } catch (e) {
    errorMessage = e.toString();
  } finally {
    isLoading = false;
    notifyListeners();
  }
}


Future<void> loginWithGoogle() async {
  isLoading = true;
  notifyListeners();

  try {
    final user = await _authService.signInWithGoogle();

    if (user != null) {
      await _userService.createUserIfNotExists(user);
    }

    errorMessage = null;
  } catch (e) {
    errorMessage = e.toString();
  } finally {
    isLoading = false;
    notifyListeners();
  }
}


Future<void> loginAnonymously() async {
  isLoading = true;
  notifyListeners();

  try {
    final user = await _authService.signInAnonymously();

    if (user != null) {
      await _userService.createUserIfNotExists(user);
    }

    errorMessage = null;
  } catch (e) {
    errorMessage = e.toString();
  } finally {
    isLoading = false;
    notifyListeners();
  }
}


  Future<void> logout() async {
    await _authService.signOut();
    notifyListeners();
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
