import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallartistry/models/photosModel.dart';
import 'dart:math';
import '../models/categoryModel.dart';

//Integrating Pexels API
class APIs {
  static List<PhotosModel> trendingWallpapers = [];
  static Future<List<PhotosModel>> getWallpapers() async {
    print('value obtained');
    await http.get(
      Uri.parse('https://api.pexels.com/v1/curated'),
      headers: {
        'Authorization':
            '[YOUR API KEY]'
      },
    ).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      photos.forEach((element) {
        trendingWallpapers.add(PhotosModel.fromAPItoApp(element));
      });
    });
    return trendingWallpapers;
  }

  // get search wallpaper
  static List<PhotosModel> searchWallpapers = [];
  static Future<List<PhotosModel>> getSearchWallpaper(String query) async {
    print('value obtained');
    await http.get(
      Uri.parse(
          'https://api.pexels.com/v1/search?query=$query&per_page=98&page=1'),
      headers: {
        'Authorization':
            'HhkLKrmFtvFbWun0fkRROQoAgJDgnLDuGvDqGccF1YusqBad2pziI0o4'
      },
    ).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      // for clearing results of previous query
      searchWallpapers.clear();
      photos.forEach((element) {
        searchWallpapers.add(PhotosModel.fromAPItoApp(element));
      });
    });
    return searchWallpapers;
  }

  // get category wallpapers

  static List<CategoryModel> categoryModelList = [];

  static Future<List<CategoryModel>> getCategoriesList() async {
    List<String> categoryName = [
      "love",
      "Cars",
      "Nature",
      "Bikes",
      "Street",
      "Flowers",
      "City",
      "Coding",
      "Abstract"
    ];

    categoryModelList.clear();

    final _random = Random();

    for (String catName in categoryName) {
      PhotosModel photoModel =
          (await getSearchWallpaper(catName))[0 + _random.nextInt(11 - 0)];
      print("IMG SRC IS HERE");
      print(photoModel.imgSrc);
      categoryModelList
          .add(CategoryModel(catImgUrl: photoModel.imgSrc, catName: catName));
    }
    print('returned');
    return categoryModelList;
  }
}
