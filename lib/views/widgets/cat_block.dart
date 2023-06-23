import 'package:flutter/material.dart';
import 'package:wallartistry/views/screens/category.dart';

class CatBlock extends StatefulWidget {
  String categoryName;
  String categoryImgSrc;
  CatBlock(
      {super.key, required this.categoryImgSrc, required this.categoryName});

  @override
  State<CatBlock> createState() => _CatBlockState();
}

class _CatBlockState extends State<CatBlock> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryScreen(
                    catImgUrl: widget.categoryImgSrc.toString(),
                    catName: widget.categoryName.toString())));
      },
      child: Container(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60.0),
              child: Image.network(
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                  widget.categoryImgSrc),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(60.0)),
            ),
            Positioned(
              left: 12,
              top: 25,
              child: Text(
                widget.categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal),
              ),
            )
          ],
        ),
      ),
    );
  }
}
