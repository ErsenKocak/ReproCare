import 'package:easy_localization/easy_localization.dart';
import 'package:reprocare/generated/locale_keys.g.dart';

extension TextFormFieldValidator on String {
  String? emptyValidator() {
    if (isEmpty) {
      return LocaleKeys.ErrorMessages_NotEmpty.tr();
    }
    return null;
  }

  String? minLenghtValidator({required int length, String? customMessage}) {
    if (this.length < length) {
      return customMessage ??
          LocaleKeys.ErrorMessages_NotShort.tr(
            namedArgs: {
              'length': length.toString(),
            },
          );
    }
    return null;
  }

  String? emailValidator() {
    const String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z.]{2,400}$";
    final RegExp regExp = RegExp(pattern);

    if (this.isEmpty) {
      return '${LocaleKeys.Global_Email.tr()} ';
    }
    if (!regExp.hasMatch(this)) {
      return LocaleKeys.ErrorMessages_InvalidEmail.tr();
    }
    return null;
  }

  String? equalValidator({
    required String? text1,
    required String? text2,
    String? message,
  }) {
    if (text1 == null || text2 == null) {
      return message ?? LocaleKeys.ErrorMessages_NotEqual.tr();
    }

    if (text1.trim() != text2.trim()) {
      return LocaleKeys.ErrorMessages_NotEqual.tr();
    }
    return null;
  }

  String? equalValidatorWithLowerCase({
    required String? text1,
    required String? text2,
    String? message,
  }) {
    if (text1 == null || text2 == null) {
      return message ?? LocaleKeys.ErrorMessages_NotEqual.tr();
    }

    if (text1.trim().toLowerCase() != text2.trim().toLowerCase()) {
      return LocaleKeys.ErrorMessages_NotEqual.tr();
    }
    return null;
  }

  String? strongPasswordValidator() {
    bool hasMinLength = this.length >= 8;
    bool hasUppercase = this.contains(RegExp(r'[A-Z]'));
    bool hasDigits = this.contains(RegExp(r'[0-9]'));
    bool hasLowercase = this.contains(RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        this.contains(RegExp(r'[!@#$%^&*_(),.?":{}|<>]'));

    if (!hasMinLength ||
        !hasUppercase ||
        !hasDigits ||
        !hasLowercase ||
        !hasSpecialCharacters)
      return LocaleKeys.ErrorMessages_NotStrongPassword.tr();

    return null;
  }
}
