import '../../helpers/errors/errors.dart';

class User {
  final String? id;
  final String fullName;
  final String username;
  final String email;
  final String? password;

  static const int minNameLenght = 2;

  User({
    required this.username,
    required this.fullName,
    this.password,
    required this.id,
    required this.email,
  }) {
    if (!User.validateName(fullName)) {
      throw EntityError(message: 'name');
    }
    if (!User.validateEmail(email)) {
      throw EntityError(message: 'email');
    }
  }

  static bool validateName(String fullName) {
    if (fullName.length < User.minNameLenght || !fullName.contains(' ')) {
      return false;
    }
    return true;
  }

  static bool validateEmail(String email) {
    RegExp regex = RegExp(
      r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)",
    );
    return regex.hasMatch(email);
  }
}
