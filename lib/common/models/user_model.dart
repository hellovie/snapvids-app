class UserModel {
  final String username;
  final String nickname;
  final String avatarUrl;
  final String coverUrl;
  final String phoneNumber;

  UserModel({
    required this.username,
    required this.nickname,
    required this.avatarUrl,
    required this.coverUrl,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'nickname': nickname,
      'avatarUrl': avatarUrl,
      'coverUrl': coverUrl,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        username: map['username'] ?? '',
        nickname: map['nickname'] ?? '',
        avatarUrl: map['avatarUrl'] ?? '',
        coverUrl: map['coverUrl'] ?? '',
        phoneNumber: map['phoneNumber'] ?? '');
  }
}
