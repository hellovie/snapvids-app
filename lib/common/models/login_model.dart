class LoginModel {
  final int id;
  final String username;
  final String lastLoginIp;
  final String lastLoginTime;
  final String registerIp;
  final String registerTime;
  final String accessToken;
  final String refreshToken;
  final int expiresInSeconds;

  LoginModel({
    required this.id,
    required this.username,
    required this.lastLoginIp,
    required this.lastLoginTime,
    required this.registerIp,
    required this.registerTime,
    required this.accessToken,
    required this.refreshToken,
    required this.expiresInSeconds,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'lastLoginIp': lastLoginIp,
      'lastLoginTime': lastLoginTime,
      'registerIp': registerIp,
      'registerTime': registerTime,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'expiresInSeconds': expiresInSeconds,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      id: map['id'] ?? 0,
      username: map['username'] ?? '',
      lastLoginIp: map['lastLoginIp'] ?? '',
      lastLoginTime: map['lastLoginTime'],
      registerIp: map['registerIp'] ?? '',
      registerTime: map['registerTime'],
      accessToken: map['accessToken'] ?? '',
      refreshToken: map['refreshToken'] ?? '',
      expiresInSeconds: map['expiresInSeconds'] ?? 0,
    );
  }
}
