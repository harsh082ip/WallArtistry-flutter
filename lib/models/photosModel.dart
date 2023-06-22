class PhotosModel {
  String imgSrc;
  String photoName;

  PhotosModel({
    required this.imgSrc,
    required this.photoName,
  });

  static fromAPItoApp(Map<String, dynamic> photoMap) {
    return PhotosModel(
        imgSrc: (photoMap['src'])['portrait'], photoName: 'photographer');
  }
}
