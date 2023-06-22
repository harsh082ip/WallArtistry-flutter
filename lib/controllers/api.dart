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
}
