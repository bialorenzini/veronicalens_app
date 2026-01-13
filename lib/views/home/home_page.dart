import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/auth_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authVM = context.watch<AuthViewModel>();
    final user = authVM.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authVM.logout();
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                size: 64,
              ),
              const SizedBox(height: 16),

              const Text(
                'Usuário logado com sucesso!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                'UID:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                user?.uid ?? 'Sem usuário',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              Text(
                'Email:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                user?.email ?? 'Login anônimo',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                onPressed: () async {
                  await authVM.logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
