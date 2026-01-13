import 'package:flutter/material.dart';
import '../../../core/components/app_nav_bar.dart';

class ARPage extends StatelessWidget {
  const ARPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('AR')),
      bottomNavigationBar: const AppNavBar(
        currentIndex: 1, // HOME
      ),
    );
  }
}
