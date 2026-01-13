import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_colors.dart';

class AppNavBar extends StatelessWidget {
  final int currentIndex;

  const AppNavBar({super.key, required this.currentIndex});

  void _go(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/ar');
        break;
      case 2:
        context.go('/camera');
        break;
      case 3:
        context.go('/settings');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          16,
          0,
          16,
          12 + bottomInset,
        ),
        child: Container(
          height: 72,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _icon(Icons.home, 0, context),
              _icon(Icons.rocket_launch, 1, context),
              _icon(Icons.camera_alt, 2, context),
              _icon(Icons.settings, 3, context),
            ],
          ),
        ),
      ),
    );
  }


  Widget _icon(IconData icon, int index, BuildContext context) {
    final active = currentIndex == index;

    return GestureDetector(
      onTap: () => _go(context, index),
      child: active
      ? Container(
        height: 54,
        width: 54,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary,
        ),
        child: Icon(icon, color: Colors.white),
      )
      : Icon(
        icon,
        size: 26,
        color: active
            ? AppColors.primary
            : AppColors.textSecondary,

      ),
    );
  }
}