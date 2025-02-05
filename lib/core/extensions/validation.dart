extension EmailValidation on String {
  bool isValidEmail() {
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(this);
  }
}

extension PasswordValidation on String {
  bool isValidPassword() {
    String passwordPattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d@$!%*?&]{6,}$';
    RegExp regExp = RegExp(passwordPattern);
    return regExp.hasMatch(this);
  }
}
