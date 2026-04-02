class AuthService {
  String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) return 'Поле не может быть пустым';
    final reg = RegExp(r'^[A-Za-zА-Яа-яЁё\s]+$');
    if (!reg.hasMatch(value.trim())) return 'ФИО: только буквы и пробелы';
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Поле не может быть пустым';
    final reg = RegExp(r'^[\w\.-]+@[\w\.-]+\.[A-Za-z]{2,}$');
    if (!reg.hasMatch(value.trim())) return 'Введите корректный email';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Поле не может быть пустым';
    final reg = RegExp(
      r'^(?=.*[A-Za-zА-Яа-яЁё])(?=.*\d)(?=.*[+_-])[A-Za-zА-Яа-яЁё\d+_-]{6,}$',
    );
    if (!reg.hasMatch(value)) {
      return 'Пароль: >=6, буквы, цифры, символ (+, _, -)';
    }
    return null;
  }

  String? validateConfirmPassword(String? pass, String? confirm) {
    if (confirm == null || confirm.isEmpty) return 'Поле не может быть пустым';
    if (pass != confirm) return 'Пароли не совпадают';
    return null;
  }
}
