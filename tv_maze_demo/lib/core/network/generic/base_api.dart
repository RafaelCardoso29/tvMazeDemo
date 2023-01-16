import 'package:dio/dio.dart';
import 'package:tv_maze_demo/core/network/generic/exceptions/app_exceptions.dart';
import 'package:tv_maze_demo/core/utils/constants/app_constants.dart';

class BaseApi {
  late Dio dio;

  BaseApi() {
    dio = Dio(
      BaseOptions(
          baseUrl: AppConstants.baseUrl,
          connectTimeout: AppConstants.timeout,
          receiveTimeout: AppConstants.timeout,
          sendTimeout: AppConstants.timeout,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          }),
    );
  }

  Future<dynamic> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    Response? response;
    try {
      response = await dio.get(url, queryParameters: queryParameters);
    } on DioError catch (e) {
      _errorHandler(e);
    }
    return response?.data;
  }

  Future<dynamic> post(String url,
      {Map<String, dynamic>? queryParameters}) async {
    Response? response;
    try {
      response = await dio.post(url, queryParameters: queryParameters);
    } on DioError catch (e) {
      _errorHandler(e);
    }
    return response?.data;
  }

  void _errorHandler(DioError e) {
    final int errorCode = e.response?.statusCode ?? 000;
    final String errorMessage =
        e.response?.statusMessage ?? 'No response from server';

    throw GenericApiError('Error: $errorCode => \n $errorMessage');
  }
}
