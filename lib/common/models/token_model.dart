class TokenModel {
  final String accessToken;
  final String refreshToken;
  final int expiresInSeconds;

  TokenModel({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresInSeconds,
  });

  Map<String, dynamic> toMap() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'expiresInSeconds': expiresInSeconds,
    };
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      accessToken: map['accessToken'] ?? '',
      refreshToken: map['refreshToken'] ?? '',
      expiresInSeconds: map['expiresInSeconds'] ?? 0,
    );
  }
}
