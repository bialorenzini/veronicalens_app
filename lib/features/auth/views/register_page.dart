import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/auth_view_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authVM = context.watch<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Criar conta')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Senha'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: confirmController,
              obscureText: true,
              decoration:
                  const InputDecoration(labelText: 'Confirmar senha'),
            ),
            const SizedBox(height: 16),

            if (authVM.errorMessage != null)
              Text(
                authVM.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),

            ElevatedButton(
              onPressed: authVM.isLoading
                  ? null
                  : () {
                      if (passwordController.text !=
                          confirmController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('As senhas não conferem'),
                          ),
                        );
                        return;
                      }

                      authVM.registerWithEmail(
                        emailController.text,
                        passwordController.text,
                      );
                    },
              child: authVM.isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Cadastrar'),
            ),

            const Divider(height: 32),

            ElevatedButton.icon(
              onPressed: authVM.isLoading ? null : authVM.loginWithGoogle,
              icon: const Icon(Icons.g_mobiledata),
              label: const Text('Continuar com Google'),
            ),

            TextButton(
              onPressed: authVM.isLoading ? null : authVM.loginAnonymously,
              child: const Text('Entrar como convidado'),
            ),
          ],
        ),
      ),
    );
  }
}
