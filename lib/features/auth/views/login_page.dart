import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../viewmodels/auth_view_model.dart';
import '../../../core/components/app_input.dart';
import '../../../core/components/app_button.dart';
import '../../../core/components/app_title.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
            const AppTitle(text: 'DE VOLTA A TRIPULAÇÃO!', fontSize: 28),
            const SizedBox(height: 40),

            AppInput(label: 'Email', controller: emailController),
            const SizedBox(height: 16),
            AppInput(label: 'Senha', controller: passwordController, obscure: true),
            const SizedBox(height: 24),

            if (authVM.errorMessage != null)
              Text(authVM.errorMessage!, style: const TextStyle(color: Colors.red), textAlign: TextAlign.center),

            const SizedBox(height: 12),

            AppButton(
              label: 'LOGIN',
              loading: authVM.isLoading,
              onPressed: () => authVM.loginWithEmail(emailController.text.trim(), passwordController.text.trim()),
            ),

            const SizedBox(height: 12),

            OutlinedButton.icon(
              onPressed: authVM.loginWithGoogle,
              icon: const Icon(Icons.g_mobiledata),
              label: const Text('GOOGLE'),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Ainda não tem uma conta?'),
                TextButton(
                  onPressed: () {
                    context.push('/register');
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
