import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Request {
  /// 请求根路径
  static const String _baseUrl = 'http://172.30.16.1:8081/api';

  /// 连接超时时间
  static const int _connectTimeout = 5000;

  /// 接收超时时间
  static const int _receiveTimeout = 5000;

  /// 发送超时时间
  static const int _sendTimeout = 5000;

  /// Dio 实例
  Dio _dio = Dio();

  static final Request _instance = Request._internal();

  Request._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(milliseconds: _connectTimeout),
      receiveTimeout: const Duration(
        milliseconds: _receiveTimeout,
      ),
      sendTimeout: const Duration(milliseconds: _sendTimeout),
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        print("请求开始...");
        // options.headers["Authorization"] = "Bearer $token";
        handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        print("请求结束，状态码：${response.statusCode}");
        print("请求结束，响应数据码：${response.data}");
        handler.next(response);
      },
      onError: (DioException e, ErrorInterceptorHandler handler) {
        print("请求错误：${e.message}");
      },
    ));
  }

  /// Get 请求
  static Future<T> get<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _instance._dio.get<T>(
        _baseUrl + path,
        queryParameters: queryParameters,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data as T;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.message ?? 'Get请求发送异常');
      }
      rethrow;
    }
  }

  /// Post 请求
  static Future<T> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _instance._dio.post<T>(
        _baseUrl + path,
        queryParameters: queryParameters,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data as T;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.message ?? 'Post请求发送异常');
      }
      rethrow;
    }
  }

  /// Put 请求
  static Future<T> put<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _instance._dio.put<T>(
        _baseUrl + path,
        queryParameters: queryParameters,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data as T;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.message ?? 'Put请求发送异常');
      }
      rethrow;
    }
  }

  /// Delete 请求
  static Future<T> delete<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _instance._dio.delete<T>(
        _baseUrl + path,
        queryParameters: queryParameters,
        data: data,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data as T;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.message ?? 'Delete请求发送异常');
      }
      rethrow;
    }
  }
}
