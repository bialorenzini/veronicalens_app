import 'package:flutter/foundation.dart';
import '../features/auth/viewmodels/auth_view_model.dart';

class AuthNotifier extends ChangeNotifier {
  final AuthViewModel authViewModel;

  AuthNotifier(this.authViewModel) {
    authViewModel.addListener(notifyListeners);
  }

  bool get isLoggedIn => authViewModel.currentUser != null;

  @override
  void dispose() {
    authViewModel.removeListener(notifyListeners);
    super.dispose();
  }
}
