import 'package:flutter/material.dart';
import '../../../core/services/firebase_auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final FirebaseAuthService _authService;

  AuthViewModel(this._authService);

  bool isLoading = false;
  String? errorMessage;

  Future<void> login(String email, String password) async {
    _setLoading(true);

    try {
      await _authService.signInWithEmail(
        email: email,
        password: password,
      );
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> register(String email, String password) async {
    _setLoading(true);

    try {
      await _authService.registerWithEmail(
        email: email,
        password: password,
      );
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      _setLoading(false);
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
