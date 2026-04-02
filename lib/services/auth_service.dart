class AuthService {
  String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Поле не может быть пустым';
    }
    final regExp = RegExp(r'^[A-Za-zА-Яа-яЁё\s]+$');
    if (!regExp.hasMatch(value.trim())) {
      return 'ФИО: только буквы и пробелы';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Поле не может быть пустым';
    }
    final regExp = RegExp(r'^[\w\.-]+@[\w\.-]+\.[A-Za-z]{2,}$');
    if (!regExp.hasMatch(value.trim())) {
      return 'Введите корректный email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле не может быть пустым';
    }
    final regExp = RegExp(
      r'^(?=.*[A-Za-zА-Яа-яЁё])(?=.*\d)(?=.*[+_-])[A-Za-zА-Яа-яЁё\d+_-]{6,}$',
    );
    if (!regExp.hasMatch(value)) {
      return 'Пароль: >=6, буквы, цифры, символ (+, _, -)';
    }
    return null;
  }

  String? validateConfirmPassword(String? password, String? confirm) {
    if (confirm == null || confirm.isEmpty) {
      return 'Поле не может быть пустым';
    }
    if (password != confirm) {
      return 'Пароли не совпадают';
    }
    return null;
  }
}
