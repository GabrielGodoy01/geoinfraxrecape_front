import '../../../../../../../generated/l10n.dart';

class ValidationHelper {
  static String? validateEmail(String? email) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\."
        r"[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (email!.isEmpty) {
      return S.current.requiredFieldAlert;
    } else if (!regExp.hasMatch(email)) {
      return S.current.invalidEmailAlert;
    }
    return null;
  }

  static String? validatePassword(String? password) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (password!.isEmpty) {
      return S.current.requiredFieldAlert;
    } else if (!regExp.hasMatch(password)) {
      return S.current.invalidPasswordAlert;
    }
    return null;
  }
}
