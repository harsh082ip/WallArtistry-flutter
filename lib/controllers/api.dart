import 'dart:convert';

import 'package:http/http.dart' as http;

//Integrating Pexels API
class APIs {
  static getWallpapers() async {
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
        Map<String, dynamic> src = element['src'];
        print(src['portrait']);
      });
    });
  }
}
