import 'package:dio/dio.dart';

class AppExceptions extends DioError {
  final String? _message;

  AppExceptions([this._message])
      : super(requestOptions: RequestOptions(path: ""));

  @override
  String toString() {
    return "$_message";
  }
}

class GenericApiError extends AppExceptions {
  GenericApiError([String message = "Generic Error"]) : super(message);
}
