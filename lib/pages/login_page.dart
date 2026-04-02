import 'package:flutter/material.dart';

import '../routes.dart';
import '../services/auth_service.dart';
import '../widgets/background_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = GlobalKey<FormState>();
  final _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();

  final _emailFocus = FocusNode();
  final _passFocus = FocusNode();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _emailFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  void _login() {
    if (_key.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const Text('Экран авторизации', textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
              const SizedBox(height: 16),
              TextFormField(
                controller: _email,
                focusNode: _emailFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_passFocus),
                decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email), border: OutlineInputBorder()),
                validator: _auth.validateEmail,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _password,
                focusNode: _passFocus,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => _login(),
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Пароль', prefixIcon: Icon(Icons.security), border: OutlineInputBorder()),
                validator: _auth.validatePassword,
              ),
              const SizedBox(height: 14),
              ElevatedButton(onPressed: _login, child: const Text('Войти')),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, Routes.register),
                child: const Text('Нет регистрации? Зарегистрироваться'),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
