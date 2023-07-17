import 'package:flutter/material.dart';

class ProfileHandles extends StatelessWidget {
  String imgUrl;
  final Color containerColor;
  String text;
  final Color textColor;
  String fontFamily;
  ProfileHandles(
      {super.key,
      required this.imgUrl,
      required this.containerColor,
      required this.text,
      required this.textColor,
      required this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      height: 52.0,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          const SizedBox(
            width: 10.0,
          ),
          Image.asset(
            imgUrl,
            height: 48.0,
            width: 48.0,
          ),
          const SizedBox(
            width: 40.0,
          ),
          Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: 32.0, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
