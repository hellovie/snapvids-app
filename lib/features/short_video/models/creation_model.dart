class CreationModel {
  final String authorAvatarUrl;
  final bool isFollowed;
  final bool isLiked;
  final int likeCount;
  final bool isCollected;
  final int collectCount;
  final int commentCount;
  final int shareCount;
  final String authorNickname;
  final String caption;
  final String bgmName;
  final String bgmCoverUrl;
  final List<String> tags;
  final String hotSearchKey;

  CreationModel({
    required this.authorAvatarUrl,
    required this.isFollowed,
    required this.isLiked,
    required this.likeCount,
    required this.isCollected,
    required this.collectCount,
    required this.commentCount,
    required this.shareCount,
    required this.authorNickname,
    required this.caption,
    required this.bgmName,
    required this.bgmCoverUrl,
    required this.tags,
    required this.hotSearchKey,
  });

  Map<String, dynamic> toMap() {
    return {
      'authorAvatarUrl': authorAvatarUrl,
      'isFollowed': isFollowed,
      'isLiked': isLiked,
      'likeCount': likeCount,
      'isCollected': isCollected,
      'collectCount': collectCount,
      'commentCount': commentCount,
      'shareCount': shareCount,
      'authorNickname': authorNickname,
      'caption': caption,
      'bgmName': bgmName,
      'bgmCoverUrl': bgmCoverUrl,
      'tags': tags,
      'hotSearchKey': hotSearchKey,
    };
  }

  factory CreationModel.fromMap(Map<String, dynamic> map) {
    return CreationModel(
      authorAvatarUrl: map['authorAvatarUrl'] ?? '',
      isFollowed: map['isFollowed'] ?? false,
      isLiked: map['isLiked'] ?? false,
      likeCount: map['likeCount'] ?? 0,
      isCollected: map['isCollected'] ?? false,
      collectCount: map['collectCount'] ?? 0,
      commentCount: map['commentCount'] ?? 0,
      shareCount: map['shareCount'] ?? 0,
      authorNickname: map['authorNickname'] ?? '',
      caption: map['caption'] ?? '',
      bgmName: map['bgmName'] ?? '',
      bgmCoverUrl: map['bgmCoverUrl'] ?? '',
      tags: map['tags'] ?? [],
      hotSearchKey: map['hotSearchKey'] ?? '',
    );
  }

  CreationModel copyWith({
    String? authorAvatarUrl,
    bool? isFollowed,
    bool? isLiked,
    int? likeCount,
    bool? isCollected,
    int? collectCount,
    int? commentCount,
    int? shareCount,
    String? authorNickname,
    String? caption,
    String? bgmName,
    String? bgmCoverUrl,
    List<String>? tags,
    String? hotSearchKey,
  }) {
    return CreationModel(
      authorAvatarUrl: authorAvatarUrl ?? this.authorAvatarUrl,
      isFollowed: isFollowed ?? this.isFollowed,
      isLiked: isLiked ?? this.isLiked,
      likeCount: likeCount ?? this.likeCount,
      isCollected: isCollected ?? this.isCollected,
      collectCount: collectCount ?? this.collectCount,
      commentCount: commentCount ?? this.commentCount,
      shareCount: shareCount ?? this.shareCount,
      authorNickname: authorNickname ?? this.authorNickname,
      caption: caption ?? this.caption,
      bgmName: bgmName ?? this.bgmName,
      bgmCoverUrl: bgmCoverUrl ?? this.bgmCoverUrl,
      tags: tags ?? this.tags,
      hotSearchKey: hotSearchKey ?? this.hotSearchKey,
    );
  }
}

final List<CreationModel> creationListMock = [
  CreationModel(
    authorAvatarUrl: 'https://hellovie.github.io/img/avatar.jpg',
    isFollowed: false,
    isLiked: true,
    likeCount: 10000,
    isCollected: false,
    collectCount: 9999,
    commentCount: 123345,
    shareCount: 0,
    authorNickname: '再睡5分钟吧',
    caption: 'KMP算法实现详解！',
    bgmName: "Nothing's Gonna Change My Love For You",
    bgmCoverUrl: 'https://y.qq.com/music/photo_new/T002R300x300M000003MM0Hs2oZ6vq_2.jpg',
    tags: ['KMP', '算法', '字符串匹配'],
    hotSearchKey: '字符串匹配算法',
  ),
];
