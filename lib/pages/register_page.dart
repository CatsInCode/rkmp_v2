import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../widgets/background_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _key = GlobalKey<FormState>();
  final _auth = AuthService();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _confirm = TextEditingController();

  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passFocus = FocusNode();
  final _confirmFocus = FocusNode();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _pass.dispose();
    _confirm.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    _passFocus.dispose();
    _confirmFocus.dispose();
    super.dispose();
  }

  void _submit() {
    if (_key.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Регистрация успешна')));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Form(
          key: _key,
          child: ListView(
            children: [
              const Text('Экран регистрации', textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
              const SizedBox(height: 16),
              TextFormField(
                controller: _name,
                focusNode: _nameFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_emailFocus),
                decoration: const InputDecoration(labelText: 'ФИО', prefixIcon: Icon(Icons.person), border: OutlineInputBorder()),
                validator: _auth.validateFullName,
              ),
              const SizedBox(height: 12),
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
                controller: _pass,
                focusNode: _passFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_confirmFocus),
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Пароль', prefixIcon: Icon(Icons.security), border: OutlineInputBorder()),
                validator: _auth.validatePassword,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _confirm,
                focusNode: _confirmFocus,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => _submit(),
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Повторите пароль', prefixIcon: Icon(Icons.security), border: OutlineInputBorder()),
                validator: (v) => _auth.validateConfirmPassword(_pass.text, v),
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: _submit, child: const Text('Зарегистрироваться')),
            ],
          ),
        ),
      ),
    );
  }
}
