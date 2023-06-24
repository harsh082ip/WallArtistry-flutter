import 'package:flutter/material.dart';

class FullScreen extends StatelessWidget {
  String imgUrl;
  FullScreen({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
      ),
    );
  }
}
