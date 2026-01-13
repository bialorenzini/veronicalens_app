import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/auth_view_model.dart';
import 'views/login_page.dart';
import 'views/home/home_page.dart';
import 'auth_gate.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Veronica Lens',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const AuthGate(),
    );
  }
}
