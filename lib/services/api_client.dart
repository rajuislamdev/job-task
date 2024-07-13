import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:job_task/services/api_interceptors.dart';

class ApiClient {
  final Dio _dio = Dio();

  ApiClient() {
    ApiInterceptors.addInterceptors(_dio);
  }

  Map<String, dynamic> defaultHeaders = {
    HttpHeaders.authorizationHeader: null,
    HttpHeaders.acceptLanguageHeader: 'en',
  };

  Future<Response> get(String url, {Map<String, dynamic>? query}) async {
    return _dio.get(
      url,
      queryParameters: query,
      options: Options(headers: defaultHeaders),
    );
  }

  Future<Response> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.post(
      url,
      data: data,
      options: Options(
        headers: headers ?? defaultHeaders,
        followRedirects: false,
        validateStatus: ((status) {
          return status! <= 500;
        }),
      ),
    );
  }

  Future<Response> put(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.put(
      url,
      data: data,
      options: Options(
        headers: headers ?? defaultHeaders,
        followRedirects: false,
        validateStatus: ((status) {
          return status! <= 500;
        }),
      ),
    );
  }

  Future<Response> delete(String url,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? query}) async {
    return _dio.delete(
      url,
      data: data,
      queryParameters: query,
      options: Options(
        headers: headers ?? defaultHeaders,
        followRedirects: false,
        validateStatus: ((status) {
          return status! <= 500;
        }),
      ),
    );
  }

  void updateToken({required String token}) {
    defaultHeaders[HttpHeaders.authorizationHeader] = 'Bearer $token';
    debugPrint(
        'Update Token:${defaultHeaders[HttpHeaders.authorizationHeader]}');
  }

  Future<void> initializeLocale({required String locale}) async {
    defaultHeaders[HttpHeaders.acceptLanguageHeader] = locale;
    debugPrint(
        'Update Local:${defaultHeaders[HttpHeaders.acceptLanguageHeader]}');
  }
}
