import 'package:flutter/material.dart';
import 'package:wallartistry/controllers/api.dart';
import 'package:wallartistry/views/screens/full_screen.dart';
import 'package:wallartistry/views/widgets/cat_block.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/photosModel.dart';

class CategoryScreen extends StatefulWidget {
  String catName;
  String catImgUrl;
  CategoryScreen({Key? key, required this.catImgUrl, required this.catName});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late List<PhotosModel> categoryResults;
  bool isLoading = true;
  GetCatRelWall() async {
    categoryResults = await APIs.getSearchWallpaper(widget.catName);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    GetCatRelWall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Wall',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 191, 0), fontSize: 25.0),
              ),
              TextSpan(
                text: 'Artistry',
                style: TextStyle(
                  color: Color.fromARGB(255, 40, 225, 46),
                  fontSize: 27.0,
                ),
              ),
            ],
          ),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  // After Search Banner
                  Stack(
                    children: [
                      // banner Image
                      Image.network(
                          height: 160,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                          widget.catImgUrl),

                      // banner text 1
                      const Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text(
                            'Category',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                      ),
                      // banner text 2
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: 25.0),
                          child: Text(
                            widget.catName,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Kablammo',
                              fontSize: 60.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 15.0,
                  ),

                  // GridView for displaying wallpapers
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    height: MediaQuery.of(context).size.height * 0.66,
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 7,
                              mainAxisExtent: 400),
                      itemCount: categoryResults.length,
                      itemBuilder: ((context, index) => InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FullScreen(
                                          imgUrl:
                                              categoryResults[index].imgSrc)));
                            },
                            child: Hero(
                              tag: categoryResults[index].imgSrc,
                              child: Container(
                                height: 500,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.network(
                                      height: 500,
                                      width: 50,
                                      fit: BoxFit.cover,
                                      categoryResults[index].imgSrc),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
