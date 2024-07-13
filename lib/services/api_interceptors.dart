import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiInterceptors {
  static void addInterceptors(Dio dio) {
    dio.options.connectTimeout = const Duration(seconds: 20);
    dio.options.receiveTimeout = const Duration(seconds: 20);
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Content-Type'] = 'application/json';
    _addLoggerInterceptor(dio);
    _addResponseHandlerInterceptor(dio);
  }

  static void _addLoggerInterceptor(Dio dio) {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }

  static void _addResponseHandlerInterceptor(Dio dio) {
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (response, handler) {
        _handleResponse(response);
        handler.next(response);
      },
      onError: (error, handler) {
        handleError(error);
        handler.next(
            error); // Use next instead of reject to proceed with the chain
      },
    ));
  }

  static void _handleResponse(Response response) {
    // Handle successful responses, if needed
    final String? message = response.data['message'];
    switch (response.statusCode) {
      case 401:
        _handleUnauthorized();
        break;
      case 302:
      case 400:
      case 403:
      case 404:
      case 409:
      case 422:
        debugPrint(message);
        // TODO show there error message
        break;
      default:
        break;
    }
  }

  static String handleError(DioException exception) {
    String errorMessage = 'An unknown error occurred';

    if (exception.response != null) {
      if (exception.response?.data is Map<String, dynamic>) {
        final Map<String, dynamic> responseData = exception.response?.data;
        if (responseData.containsKey('message')) {
          errorMessage = responseData['message'];
        }
      } else {
        errorMessage = exception.response?.statusMessage ?? errorMessage;
      }
    }

    debugPrint('DioError: ${exception.type}');
    debugPrint('Error message: $errorMessage');
    debugPrint('Error details: ${exception.message}');

    // Handle errors
    switch (exception.type) {
      case DioExceptionType.receiveTimeout:
        return 'Receive time out!';
      case DioExceptionType.sendTimeout:
        return 'Send time out!';
      case DioExceptionType.badResponse:
        return 'Bad response!';
      case DioExceptionType.badCertificate:
        return 'Bad certificate response!';
      case DioExceptionType.cancel:
        return 'Request cancelled by server!';
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return errorMessage;
      default:
        return errorMessage;
    }
  }

  static void _handleUnauthorized() {
    // Box authBox = Hive.box(AppConstants.authBox);
    // authBox.delete(AppConstants.authToken);
    // GlobalFunction.showCustomSnackbar(
    //     message: 'Unauthenticated', isSuccess: false);
    // GlobalFunction.navigatorKey.currentState
    //     ?.pushNamedAndRemoveUntil(Routes.login, (route) => false);
  }
}
