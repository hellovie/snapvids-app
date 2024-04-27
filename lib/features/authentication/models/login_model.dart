

import 'package:snapvids_app/common/models/token_model.dart';

class LoginModel {
  final int id;
  final String username;
  final String lastLoginIp;
  final String lastLoginTime;
  final String registerIp;
  final String registerTime;
  final TokenModel tokenModel;

  LoginModel({
    required this.id,
    required this.username,
    required this.lastLoginIp,
    required this.lastLoginTime,
    required this.registerIp,
    required this.registerTime,
    required this.tokenModel,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'lastLoginIp': lastLoginIp,
      'lastLoginTime': lastLoginTime,
      'registerIp': registerIp,
      'registerTime': registerTime,
      'tokenModel': tokenModel,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    final tokenMap = {
      'accessToken': map['accessToken'] ?? '',
      'refreshToken': map['refreshToken'] ?? '',
      'expiresInSeconds': map['expiresInSeconds'] ?? 0,
    };
    return LoginModel(
      id: map['id'] ?? 0,
      username: map['username'] ?? '',
      lastLoginIp: map['lastLoginIp'] ?? '',
      lastLoginTime: map['lastLoginTime'],
      registerIp: map['registerIp'] ?? '',
      registerTime: map['registerTime'],
      tokenModel: TokenModel.fromMap(tokenMap),
    );
  }
}
