import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:reprocare/generated/locale_keys.g.dart';

sealed class Result<S, E extends AppException?> {
  const Result();
  static const String _jsonNodeError = "error";
  static const String _jsonNodeErrors = "errors";
  static const String _isSuccess = "success";
  static const String _result = "result";
  static const String _message = "message";

  static Result<T, AppException> fromResponse<T>(
    Response? response,
    T Function(dynamic) mapper,
  ) {
    final responseData = response?.data;

    if (responseData != null && responseData != '') {
      if (responseData is Map &&
          (responseData[_jsonNodeErrors] != null ||
              responseData[_jsonNodeError] != null ||
              responseData[_isSuccess] != true)) {
        return Failure(AppException(_getErrorMessage(responseData[_message])));
      }
      return Success(mapper(responseData[_result]));
    } else {
      return Failure(AppException(LocaleKeys.ErrorMessages_GlobalError.tr()));
    }
  }

  static String _getErrorMessage(String? message) {
    if (message != null && message != '') {
      return message;
    } else {
      return LocaleKeys.ErrorMessages_GlobalError.tr();
    }
  }
}

final class Success<S, E extends AppException> extends Result<S, E> {
  const Success(this.value);
  final S value;
}

final class Failure<S, E extends AppException> extends Result<S, E> {
  const Failure(this.exception);
  final E exception;
}

class AppException implements Exception {
  final String message;

  AppException(this.message);
}
