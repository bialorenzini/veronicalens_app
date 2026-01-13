import 'package:flutter/material.dart';
import '../../../core/components/app_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Página ${currentIndex + 1}', style: const TextStyle(fontSize: 24)),
      ),
      bottomNavigationBar: AppNavBar(currentIndex: currentIndex, onTap: onTabTapped),
    );
  }
}