import 'dart:convert';

class LogJson {
  static String format(var value, {String? title}) {
    try {
      if (value != null) {
        if (value is String) {
          return '${title != null ? '=========  ${title}  =========     \n\n' : ''} \n ${value}';
        } else {
          return '${title != null ? '=========  ${title}  =========     \n\n' : ''} ${value.runtimeType}\n${JsonEncoder.withIndent('  ').convert(value)}';
        }
      } else {
        if (title != null) {
          return '=========  ${title}  =========';
        } else {
          return '========= title is Null=========';
        }
      }
    } catch (e) {
      return '=========  ${title}  =========      \n\n LogJson Value is not convertable !!!';
    }
  }
}
