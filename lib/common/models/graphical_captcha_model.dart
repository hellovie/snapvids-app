class GraphicalCaptchaModel {
  final String captchaId;
  final String base64Captcha;

  GraphicalCaptchaModel({
    required this.captchaId,
    required this.base64Captcha,
  });

  Map<String, dynamic> toMap() {
    return {
      'captchaId': captchaId,
      'base64Captcha': base64Captcha,
    };
  }

  factory GraphicalCaptchaModel.fromMap(Map<String, dynamic> map) {
    return GraphicalCaptchaModel(
      captchaId: map['captchaId'] ?? '',
      base64Captcha: map['base64Captcha'] ?? '',
    );
  }
}
