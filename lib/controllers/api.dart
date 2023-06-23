import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallartistry/models/photosModel.dart';

//Integrating Pexels API
class APIs {
  static List<PhotosModel> trendingWallpapers = [];
  static Future<List<PhotosModel>> getWallpapers() async {
    print('value obtained');
    await http.get(
      Uri.parse('https://api.pexels.com/v1/curated'),
      headers: {
        'Authorization':
            'HhkLKrmFtvFbWun0fkRROQoAgJDgnLDuGvDqGccF1YusqBad2pziI0o4'
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
          'https://api.pexels.com/v1/search?query=$query&per_page=28&page=1'),
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
}
