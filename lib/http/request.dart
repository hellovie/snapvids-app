import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:snapvids_app/common/widgets/toast.dart';
import 'package:snapvids_app/http/result_response.dart';

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
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(milliseconds: _connectTimeout),
        receiveTimeout: const Duration(
          milliseconds: _receiveTimeout,
        ),
        sendTimeout: const Duration(milliseconds: _sendTimeout),
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          Toast.showLoading();
          // options.headers["Authorization"] = "Bearer $token";
          handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          Toast.dismissLoading();
          if (response.statusCode.toString().startsWith('2')) {
            ResultResponse result = ResultResponse.fromJson(response.data);
            if (!result.success) {
              Toast.error(result.message);
              return;
            }

            handler.next(response);
            return;
          }

          _handleNonSuccessResponses(response, handler);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          Toast.show('网络请求失败，请检查您的网络');
        },
      ),
    );
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

  void _handleNonSuccessResponses(Response response, ResponseInterceptorHandler handler) {
    // Todo：需要对不同状态码进行分别处理
    if (response.statusCode == 401) {}

    if (response.statusCode == 403) {}

    if (response.statusCode == 404) {}

    ResultResponse result = ResultResponse.fromJson(response.data);
    Toast.error(result.message);
  }
}
