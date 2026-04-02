import 'package:flutter/material.dart';

import 'profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Главный экран')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Вы успешно вошли в систему'),
            const SizedBox(height: 8),
            Text(email),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ProfileScreen(
                      fullName: 'Иванов Иван Иванович',
                      email: email,
                    ),
                  ),
                );
              },
              child: const Text('Открыть профиль'),
            ),
          ],
        ),
      ),
    );
  }
}
