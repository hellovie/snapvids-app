import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:snapvids_app/common/models/token_model.dart';
import 'package:snapvids_app/utils/constants/error_codes.dart';
import 'package:snapvids_app/utils/helpers/function_helper.dart';
import 'package:snapvids_app/utils/helpers/toast_helper.dart';
import 'package:snapvids_app/utils/http/result_response.dart';
import 'package:snapvids_app/utils/storages/login_storages.dart';

class HttpRequest {
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

  static final HttpRequest _instance = HttpRequest._internal();

  HttpRequest._internal() {
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
          ToastHelper.showLoading();
          _addAuthorizationHeader(options, LoginStorages.getAccessToken());
          handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) async {
          ToastHelper.dismissLoading();
          if (response.statusCode.toString().startsWith('2')) {
            ResultResponse result = ResultResponse.fromJson(response.data);
            if (result.success) {
              handler.next(response);
              return;
            }

            // 访问令牌过期，可以刷新令牌后再请求
            if (result.code == ErrorCodes.accessTokenHasExpired) {
              String newAccessToken = await _refreshToken();
              _addAuthorizationHeader(response.requestOptions, newAccessToken);
              return handler.resolve(await _instance._dio.fetch(response.requestOptions));
            }

            // 刷新令牌过期，重新登录
            if (result.code == ErrorCodes.refreshTokenHasExpired) {
              // Global.navigatorKey.currentState
              //     ?.pushNamedAndRemoveUntil(Routes.login, (route) => false);
              ToastHelper.show('用户未登录');
              return;
            }

            ToastHelper.show(result.message);
            return;
          }
        },
        onError: (DioException ex, ErrorInterceptorHandler handler) {
          ToastHelper.dismissLoading();
          _handleNonSuccessResponses(ex, handler);
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

  void _handleNonSuccessResponses(DioException ex, ErrorInterceptorHandler handler) {
    if (ex.response?.statusCode == 401) {
      // Global.navigatorKey.currentState?.pushNamedAndRemoveUntil(Routes.login, (route) => false);
      ToastHelper.show('用户未登录');
      return;
    }

    if (ex.response?.statusCode == 403) {
      // Global.navigatorKey.currentState?.pushNamedAndRemoveUntil(Routes.index, (route) => false);
      ToastHelper.show('无权限访问');
      return;
    }

    if (ex.response?.statusCode == 404) {
      // Global.navigatorKey.currentState?.pushNamedAndRemoveUntil(Routes.index, (route) => false);
      ToastHelper.show('资源不存在');
      return;
    }

    ToastHelper.show('网络请求失败，请检查您的网络');
  }

  void _addAuthorizationHeader(RequestOptions options, String token) {
    if (FunctionHelper.isLogin()) {
      options.headers["Authorization"] = "Bearer $token";
    }
  }

  Future<String> _refreshToken() async {
    // Todo：仅保留一个刷新令牌请求即可
    LoginStorages.renewAccessTokenWithRefreshToken();
    ResultResponse<TokenModel> res = await _refreshTokenRequest();
    TokenModel? data = res.data;
    if (data != null) {
      LoginStorages.saveToken(res.data);
      return data.accessToken;
    }
    return '';
  }

  Future<ResultResponse<TokenModel>> _refreshTokenRequest() async {
    final res = await HttpRequest.get('/tokens/refresh');
    final ResultResponse<TokenModel> result =
    ResultResponse.fromJson(res, dataFromJson: TokenModel.fromMap);
    return result;
  }
}
