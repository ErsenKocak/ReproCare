class HttpResponseModel<T> {
  final bool hasError;
  final int statusCode;
  final String errorCode;
  final String errorMessage;
  final T? response;

  HttpResponseModel({
    this.hasError = false,
    this.statusCode = 200,
    this.errorCode = "",
    this.errorMessage = "",
    required this.response,
  });
}
