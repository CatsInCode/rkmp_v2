import 'package:flutter/material.dart';

import '../routes.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E78D7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: const Icon(Icons.work_outline, size: 56, color: Color(0xFF1E78D7)),
            ),
            const SizedBox(height: 28),
            const Text(
              'Magenta',
              style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Загрузка приложения...',
              style: TextStyle(fontSize: 22, color: Colors.white70),
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: 220,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: const LinearProgressIndicator(
                  value: 0.62,
                  minHeight: 6,
                  backgroundColor: Colors.white30,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'Версия 1.0.0',
              style: TextStyle(fontSize: 16, color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }
}
