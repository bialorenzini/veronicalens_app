import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/components/app_nav_bar.dart';
import '../../auth/viewmodels/auth_view_model.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authVM = context.read<AuthViewModel>();

    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.logout),
          label: const Text('Logout'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          ),
          onPressed: () async {
            await authVM.logout();
            
          },
        ),
      ),
      bottomNavigationBar: const AppNavBar(
        currentIndex: 3,
      ),
    );
  }
}
