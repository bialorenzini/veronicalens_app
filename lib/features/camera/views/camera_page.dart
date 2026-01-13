import 'package:flutter/material.dart';
import '../../../core/components/app_nav_bar.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Camera')),
      bottomNavigationBar: const AppNavBar(
        currentIndex: 2, // HOME
      ),
    );
  }
}
