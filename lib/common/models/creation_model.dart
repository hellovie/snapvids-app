import 'package:snapvids_app/common/enums/ui_enums.dart';

class CreationModel {
  final int id;
  final String caption;
  final String authorNickname;
  final String authorAvatarUrl;
  final bool isLiked;
  final int likeCount;
  final bool isCollectd;
  final int collectCount;
  final int commentCount;
  final int shareCount;
  final String bgmName;
  final String bgmCoverUrl;
  final bool isFollowed;
  final PlayState playState;
  final String creationUrl;
  final String coverUrl;

  CreationModel({
    required this.id,
    required this.caption,
    required this.authorNickname,
    required this.authorAvatarUrl,
    required this.isLiked,
    required this.likeCount,
    required this.isCollectd,
    required this.collectCount,
    required this.commentCount,
    required this.shareCount,
    required this.bgmName,
    required this.bgmCoverUrl,
    required this.isFollowed,
    this.playState = PlayState.init,
    required this.creationUrl,
    required this.coverUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'caption': caption,
      'authorAvatarUrl': authorAvatarUrl,
      'authorNickname': authorNickname,
      'isLiked': isLiked,
      'likeCount': likeCount,
      'isCollectd': isCollectd,
      'collectCount': collectCount,
      'commentCount': commentCount,
      'shareCount': shareCount,
      'bgmName': bgmName,
      'bgmCoverUrl': bgmCoverUrl,
      'isFollowed': isFollowed,
      'playState': playState,
      'creationUrl': creationUrl,
      'creationUrl': coverUrl,
    };
  }

  factory CreationModel.fromMap(Map<String, dynamic> map) {
    return CreationModel(
      id: map['id'] ?? 0,
      caption: map['caption'] ?? '',
      authorNickname: map['authorNickname'] ?? '',
      authorAvatarUrl: map['authorAvatarUrl'] ?? '',
      isLiked: map['isLiked'] ?? false,
      likeCount: map['likeCount'] ?? 0,
      isCollectd: map['isCollectd'] ?? false,
      collectCount: map['collectCount'] ?? 0,
      commentCount: map['commentCount'] ?? 0,
      shareCount: map['shareCount'] ?? 0,
      bgmName: map['bgmName'] ?? '',
      bgmCoverUrl: map['bgmCoverUrl'] ?? '',
      isFollowed: map['isFollowed'] ?? false,
      creationUrl: map['creationUrl'] ?? '',
      coverUrl: map['coverUrl'] ?? '',
    );
  }

  CreationModel copyWith({
    int? id,
    String? caption,
    String? authorNickname,
    String? authorAvatarUrl,
    bool? isLiked,
    int? likeCount,
    bool? isCollectd,
    int? collectCount,
    int? commentCount,
    int? shareCount,
    String? bgmName,
    String? bgmCoverUrl,
    String? creationUrl,
    String? coverUrl,
    bool? isFollowed,
    PlayState? playState,
  }) {
    return CreationModel(
      id: id ?? this.id,
      caption: caption ?? this.caption,
      authorNickname: authorNickname ?? this.authorNickname,
      authorAvatarUrl: authorAvatarUrl ?? this.authorAvatarUrl,
      isLiked: isLiked ?? this.isLiked,
      likeCount: likeCount ?? this.likeCount,
      isCollectd: isCollectd ?? this.isCollectd,
      collectCount: collectCount ?? this.collectCount,
      commentCount: commentCount ?? this.commentCount,
      shareCount: shareCount ?? this.shareCount,
      bgmName: bgmName ?? this.bgmName,
      bgmCoverUrl: bgmCoverUrl ?? this.bgmCoverUrl,
      creationUrl: creationUrl ?? this.creationUrl,
      coverUrl: coverUrl ?? this.coverUrl,
      isFollowed: isFollowed ?? this.isFollowed,
      playState: playState ?? this.playState,
    );
  }
}
