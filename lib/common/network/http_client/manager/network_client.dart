import 'dart:io';

import 'package:easy_localization/easy_localization.dart';

import 'package:dio/dio.dart';
import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/common/init/service_locator/service_locator_provider.dart';
import 'package:reprocare/common/network/http_client/interceptor/dio_chucker_interceptor.dart';
import 'package:reprocare/common/network/http_client/interceptor/dio_logger_interceptor.dart';
import 'package:reprocare/common/network/http_client/model/cancel_token.dart';
import 'package:reprocare/common/widgets/app_loading/app_loading.dart';
import 'package:reprocare/common/widgets/bottom_sheets/bottom_sheet/app_bottom_sheet.dart';
import 'package:reprocare/common/widgets/bottom_sheets/error_bottom_sheet/error_bottom_sheet.dart';
import 'package:reprocare/core/constants/application/application.dart';
import 'package:reprocare/core/constants/cache/cache_constants.dart';
import 'package:reprocare/core/constants/network/http_call_type/http_call_type.dart';
import 'package:reprocare/features/login/data/services/local/i_auth_local_service.dart';
import 'package:reprocare/features/login/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:reprocare/features/settings/domain/entities/response/user_settings_entity/user_entity.dart';
import 'package:reprocare/generated/locale_keys.g.dart';
import 'package:reprocare/helper/localization/localization_helper.dart';
import 'package:reprocare/helper/network/internet_connection_check/internet_connection_check_helper.dart';

final class NetworkClient {
  NetworkClient({
    required Dio dio,
    required InternetConnectionCheckHelper connectionCheckHelper,
  })  : _connectionCheckHelper = connectionCheckHelper,
        _dio = dio {
    // _dio.interceptors.add(DioRetryInterceptor.getInterceptor(dio: dio));
    _dio.interceptors.add(DioLoggerInterceptor.getInterceptor());
    _dio.interceptors.add(DioChuckerInterceptor.getInterceptor());
  }

  final Dio _dio;
  final InternetConnectionCheckHelper _connectionCheckHelper;

  // Call:----------------------------------------------------------------------

  Future<Result<T, AppException>> call<T>({
    required String path,
    required HttpCallType callType,
    required T Function(dynamic json) mapper,
    bool? withOutResponse = false,
    dynamic data,
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    String? savePath,
  }) async {
    try {
      // bool hasConnection = await connectionCheckHelper.checkConnectivity();
      // if (hasConnection == true) {
      //   mapper = (json) {
      //     return false as T;
      //   };
      //   throw DioException(
      //       requestOptions: RequestOptions(),
      //       response: Response(requestOptions: RequestOptions(), data: {
      //         'error': 'İnternet Bağlantınız bulunmamaktadır.',
      //         'success': false
      //       }));
      // }

      late Response<dynamic> dioResponse;
      cancelToken = AppCancelToken.cancelToken;
      Map<String, String> headers = await _generateHeaders();
      options ??= Options();
      options = options.copyWith(headers: headers);
      if (callType == HttpCallType.GET)
        dioResponse = await _get(
          path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        );

      if (callType == HttpCallType.POST)
        dioResponse = await _post(
          path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          data: data,
        );

      if (callType == HttpCallType.PUT)
        dioResponse = await _put(
          path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          data: data,
        );

      if (callType == HttpCallType.DELETE)
        dioResponse = await _delete(
          path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          data: data,
        );
      if (callType == HttpCallType.PATCH)
        dioResponse = await _patch(
          path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          data: data,
        );
      if (callType == HttpCallType.DOWNLOAD)
        dioResponse = await _download(
          path,
          savePath,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          data: data,
        );

      // final fromResponse = Result.fromResponse(dioResponse, mapper);
      // return fromResponse;
      return _handleResponse(dioResponse, mapper, withOutResponse!);
    } on DioException catch (exception) {
      return _handleErrors(exception, mapper);
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response<T>> _get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );

    return response;
  }

  // Post:----------------------------------------------------------------------
  Future<Response<T>> _post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  // Put:-----------------------------------------------------------------------
  Future<Response<T>> _put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await _dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  // Delete:--------------------------------------------------------------------
  Future<Response<T>> _delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return response;
  }

  // Patch:---------------------------------------------------------------------
  Future<Response<T>> _patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await _dio.patch<T>(
      path,
      queryParameters: queryParameters,
      data: data,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  // Download:------------------------------------------------------------------
  Future<Response<dynamic>> _download<T>(
    String urlPath,
    dynamic savePath, {
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    dynamic data,
    Options? options,
  }) async {
    final response = await _dio.download(
      urlPath,
      savePath,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      deleteOnError: deleteOnError,
      lengthHeader: lengthHeader,
      data: data,
      options: options,
    );

    return response;
  }

  Future<Map<String, String>> _generateHeaders() async {
    Map<String, String> headers = {
      // "X-Version-Code": "${Application.versionCode}",
      // "X-Version-Name": "${Application.versionName}",
      // "Accept-Language":
      //     "${AppLocalizationHelper.currentLocale.languageCode.toUpperCase()}",
    };
    final IAuthLocalService _loginService =
        ServiceLocatorProvider.provide<IAuthLocalService>();
    UserEntity? _loginReponseEntity =
        await _loginService.get(CacheConstants.User.name);
    String token = _loginReponseEntity?.token ?? '';

    if (token.isNotEmpty) {
      headers.addAll({"Authorization": "Bearer $token"});
    }

    return headers;
  }

  Future<Result<T, AppException>> _handleResponse<T>(
    Response? dioResponse,
    T Function(dynamic) mapper,
    bool withOutResponse,
  ) async {
    late Result<T, AppException> response;

    if (withOutResponse) {
      switch (dioResponse?.statusCode) {
        case HttpStatus.ok:
        case HttpStatus.accepted:
        case HttpStatus.noContent:
          dioResponse?.data = {'result': true};
          // response = Result.fromResponse(dioResponse, mapper);
          response = Success(true as T);
      }
    } else {
      response = Result.fromResponse(dioResponse, mapper);
    }

    return response;
  }

  Future<Result<T, AppException>> _handleErrors<T>(
    DioException exception,
    T Function(dynamic) mapper,
  ) async {
    AppLoading.dismissLoading();

    switch (exception.response?.statusCode) {
      case HttpStatus.unauthorized:
      case HttpStatus.forbidden:
        await AppBottomSheet.show(
          child: (bottomSheetContext) => ErrorBottomSheet(
            headerMessage: LocaleKeys.ErrorMessages_SessionExpired.tr(),
            bodyMessage: LocaleKeys.ErrorMessages_PleaseReLogin.tr(),
          ),
        );
        final authCubit = ServiceLocatorProvider.provide<AuthCubit>();
        await authCubit.logout();
        AppCancelToken.cancelToken.cancel();
        AppCancelToken.initialize();

        throw exception;

      default:
    }

    return Result.fromResponse(exception.response, mapper);
  }
}
