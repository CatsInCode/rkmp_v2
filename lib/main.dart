import 'package:flutter/material.dart';

import 'screens/welcome_screen.dart';

void main() {
  runApp(const ApartmentAuthApp());
}

class ApartmentAuthApp extends StatelessWidget {
  const ApartmentAuthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
