import 'package:flutter/material.dart';

enum InputFieldType { fullName, email, password, confirmPassword }

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.inputType,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.passwordToConfirm,
  });

  final InputFieldType inputType;
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final String? passwordToConfirm;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _hidePassword = true;

  String? _validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Поле не может быть пустым';
    }

    switch (widget.inputType) {
      case InputFieldType.fullName:
        final nameRegExp = RegExp(r'^[A-Za-zА-Яа-яЁё\s]+$');
        if (!nameRegExp.hasMatch(value.trim())) {
          return 'ФИО: только буквы и пробелы';
        }
        break;
      case InputFieldType.email:
        final emailRegExp = RegExp(r'^[\w\.-]+@[\w\.-]+\.[A-Za-z]{2,}$');
        if (!emailRegExp.hasMatch(value.trim())) {
          return 'Введите корректный email';
        }
        break;
      case InputFieldType.password:
        final passwordRegExp = RegExp(
          r'^(?=.*[A-Za-zА-Яа-яЁё])(?=.*\d)(?=.*[+_-])[A-Za-zА-Яа-яЁё\d+_-]{6,}$',
        );
        if (!passwordRegExp.hasMatch(value)) {
          return 'Пароль: >=6, буквы, цифры, символ (+, _, -)';
        }
        break;
      case InputFieldType.confirmPassword:
        if (value != widget.passwordToConfirm) {
          return 'Пароли не совпадают';
        }
        break;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isPassword =
        widget.inputType == InputFieldType.password ||
        widget.inputType == InputFieldType.confirmPassword;

    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: isPassword && _hidePassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: widget.inputType == InputFieldType.email
          ? TextInputType.emailAddress
          : TextInputType.text,
      textInputAction: widget.nextFocusNode != null
          ? TextInputAction.next
          : TextInputAction.done,
      onFieldSubmitted: (_) {
        if (widget.nextFocusNode != null) {
          FocusScope.of(context).requestFocus(widget.nextFocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _hidePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _hidePassword = !_hidePassword;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.black54),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
      validator: _validator,
    );
  }
}
