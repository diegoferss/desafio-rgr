import '../utils/constants/regex.dart';

extension StringExtension on String {
  bool isEmailValid() {
    return contains(RegExp(Regex.email));
  }
}
