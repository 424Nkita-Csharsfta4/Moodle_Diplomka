// ignore_for_file: unnecessary_new, curly_braces_in_flow_control_structures

class Validations {
  static String? validateName(String value) {
    if (value.isEmpty) return 'Имя обязательно.';
    final RegExp nameExp = new RegExp(r'^[A-za-zğüşöçİĞÜŞÖÇ ]+$');
    if (!nameExp.hasMatch(value))
      return 'Пожалуйста, введите только алфавитные символы.';
    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) return 'Пожалуйста, введите адрес электронной почты.';
    final RegExp nameExp = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,2"
        r"53}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-z"
        r"A-Z0-9])?)*$");
    if (!nameExp.hasMatch(value)) return 'Неверный адрес электронной почты';
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty || value.length < 6)
      return 'Пожалуйста, введите правильный пароль.';
    return null;
  }
}
