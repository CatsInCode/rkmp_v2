import 'package:flutter/material.dart';

import '../routes.dart';
import '../services/auth_service.dart';
import '../widgets/background_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _key = GlobalKey<FormState>();
  final _auth = AuthService();
  final _name = TextEditingController(text: 'Иванов Иван Иванович');
  final _email = TextEditingController(text: 'test123@mail.ru');
  final _pass = TextEditingController();
  final _confirm = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _pass.dispose();
    _confirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Form(
          key: _key,
          child: ListView(
            children: [
              const Text('Экран профиля', textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
              const SizedBox(height: 14),
              CircleAvatar(radius: 45, child: ClipOval(child: Image.asset('assets/images/profile_photo.jpg', fit: BoxFit.cover, width: 90, height: 90, errorBuilder: (_,__,___)=>const Icon(Icons.person,size:50)))),
              const SizedBox(height: 14),
              TextFormField(controller: _name, decoration: const InputDecoration(labelText: 'ФИО', prefixIcon: Icon(Icons.person), border: OutlineInputBorder()), validator: _auth.validateFullName),
              const SizedBox(height: 12),
              TextFormField(controller: _email, decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email), border: OutlineInputBorder()), validator: _auth.validateEmail),
              const SizedBox(height: 12),
              TextFormField(controller: _pass, obscureText: true, decoration: const InputDecoration(labelText: 'Пароль', prefixIcon: Icon(Icons.security), border: OutlineInputBorder()), validator: _auth.validatePassword),
              const SizedBox(height: 12),
              TextFormField(controller: _confirm, obscureText: true, decoration: const InputDecoration(labelText: 'Повторите пароль', prefixIcon: Icon(Icons.security), border: OutlineInputBorder()), validator: (v)=>_auth.validateConfirmPassword(_pass.text, v)),
              const SizedBox(height: 14),
              ElevatedButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Профиль сохранен')));
                  }
                },
                child: const Text('Сохранить'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 1,
        onDestinationSelected: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, Routes.home);
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Главная'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Профиль'),
        ],
      ),
    );
  }
}
