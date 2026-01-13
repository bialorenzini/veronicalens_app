import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/auth_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authVM = context.watch<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),

            // EMAIL
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // SENHA
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24),

            // ERRO
            if (authVM.errorMessage != null)
              Text(
                authVM.errorMessage!,
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),

            const SizedBox(height: 12),

            // LOADING
            if (authVM.isLoading)
              const Center(child: CircularProgressIndicator()),

            if (!authVM.isLoading) ...[
              // LOGIN EMAIL
              ElevatedButton(
                onPressed: () {
                  authVM.loginWithEmail(
                    _emailController.text.trim(),
                    _passwordController.text.trim(),
                  );
                },
                child: const Text('Entrar'),
              ),

              const SizedBox(height: 12),

              // LOGIN GOOGLE
              OutlinedButton.icon(
                onPressed: authVM.loginWithGoogle,
                icon: const Icon(Icons.g_mobiledata),
                label: const Text('Entrar com Google'),
              ),

              const SizedBox(height: 12),

              // LOGIN ANÔNIMO
              TextButton(
                onPressed: authVM.loginAnonymously,
                child: const Text('Entrar como convidado'),
              ),
            ],

            const Spacer(),

            // LINK PARA CADASTRO
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Não tem conta?'),
                TextButton(
                  onPressed: () {
                    // futuramente: Navigator.push para RegisterPage
                  },
                  child: const Text('Cadastre-se'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
