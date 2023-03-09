///Validator extension methods for text fields
extension TextFieldValidators on String? {
  String? validateEmail() {
    if (this?.isEmpty ?? true) {
      return 'Email is required';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this!)) {
      return 'Email is invalid';
    }
    return null;
  }

  String? validatePassword() {
    if (this?.isEmpty ?? true) {
      return 'Password is required';
    }
    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(this!)) {
      return 'Please enter a strong password';
    }
    return null;
  }
}
