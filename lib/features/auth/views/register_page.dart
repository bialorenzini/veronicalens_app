import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../viewmodels/auth_view_model.dart';
import '../../../core/components/app_input.dart';
import '../../../core/components/app_button.dart';
import '../../../core/components/app_title.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 60),
            const AppTitle(text: 'NOVO MEMBRO NA TRIPULAÇÃO!', fontSize: 28),
            const SizedBox(height: 40),

            AppInput(label: 'Email', controller: emailController),
            const SizedBox(height: 16),
            AppInput(label: 'Senha', controller: passwordController, obscure: true),
            const SizedBox(height: 16),
            AppInput(label: 'Confirmar Senha', controller: confirmController, obscure: true),
            const SizedBox(height: 24),

            if (authVM.errorMessage != null)
              Text(authVM.errorMessage!, style: const TextStyle(color: Colors.red), textAlign: TextAlign.center),

            AppButton(
              label: 'CADASTRE-SE',
              loading: authVM.isLoading,
              onPressed: () {
                if (passwordController.text != confirmController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Senhas não conferem')));
                  return;
                }
                authVM.registerWithEmail(emailController.text.trim(), passwordController.text.trim());
              },
            ),
            
            const SizedBox(height: 12),

            OutlinedButton.icon(
              onPressed: authVM.loginWithGoogle,
              icon: const Icon(Icons.g_mobiledata),
              label: const Text('GOOGLE'),
            ),

            TextButton(
              onPressed: authVM.isLoading ? null : authVM.loginAnonymously,
              child: const Text('Entrar como convidado'),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Já tem uma conta?'),
                TextButton(
                  onPressed: () {
                    context.push('/login');
                  },
                  child: const Text('Faça login.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
