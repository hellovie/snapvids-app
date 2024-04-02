class ResultResponse<T> {
  /// 接口是否调用成功（成功：true）
  final bool success;

  /// 状态码
  final String code;

  /// 响应描述
  final String message;

  /// 响应数据
  final T? data;

  /// 接口调用时间
  final String timestamp;

  ///是否能够重试（可以重试：true）
  final bool canRetry;

  /// 日志跟踪 ID
  final String traceId;

  const ResultResponse({
    required this.success,
    this.code = '',
    required this.message,
    required this.data,
    required this.timestamp,
    this.canRetry = false,
    this.traceId = '',
  });

  factory ResultResponse.fromJson(
    Map<String, dynamic> json, {
    T Function(Map<String, dynamic>)? dataFromJson,
  }) {
    return ResultResponse(
      success: json['success'] ?? false,
      code: json['code'] ?? '',
      message: json['message'] ?? '服务器繁忙，请稍后再试',
      data: dataFromJson != null ? dataFromJson(json['data']) : json['data'],
      timestamp: json['timestamp'] ?? '',
      canRetry: json['canRetry'] ?? false,
      traceId: json['traceId'] ?? '',
    );
  }
}
