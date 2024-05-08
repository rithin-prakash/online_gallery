class PhotoModel {
  final String previewUrl;
  final String webFormatUrl;
  final String largeImageUrl;
  final int previewWidth;
  final int previewHeight;
  final int imageWidth;
  final int imageHeight;
  final int id;
  final int imageSize;
  final int views;
  final int likes;

  PhotoModel({
    required this.webFormatUrl,
    required this.largeImageUrl,
    required this.previewWidth,
    required this.previewHeight,
    required this.imageWidth,
    required this.imageHeight,
    required this.id,
    required this.imageSize,
    required this.views,
    required this.likes,
    required this.previewUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      previewUrl: json['previewURL'],
      webFormatUrl: json['webformatURL'],
      largeImageUrl: json['largeImageURL'],
      previewWidth: json['previewWidth'],
      previewHeight: json['previewHeight'],
      imageWidth: json['imageWidth'],
      imageHeight: json['imageHeight'],
      id: json['id'],
      imageSize: json['imageSize'],
      views: json['views'],
      likes: json['likes'],
    );
  }
}
