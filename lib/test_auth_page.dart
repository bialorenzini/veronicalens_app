import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'viewmodels/auth_view_model.dart';

class TestAuthPage extends StatefulWidget {
  const TestAuthPage({super.key});

  @override
  State<TestAuthPage> createState() => _TestAuthPageState();
}

class _TestAuthPageState extends State<TestAuthPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authVM = context.watch<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Teste Firebase Auth')),
      body: Center(
        child: Text(
          authVM.isLoading ? 'Carregando...' : 'Provider OK',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

}
