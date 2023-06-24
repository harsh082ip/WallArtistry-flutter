import 'package:flutter/material.dart';
import 'package:wallartistry/controllers/api.dart';
import 'package:wallartistry/models/photosModel.dart';
import 'package:wallartistry/views/screens/full_screen.dart';

class SearchScreen extends StatefulWidget {
  String query;
  SearchScreen({Key? key, required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<PhotosModel> searchRes = [];

  searchResults() async {
    searchRes = await APIs.getSearchWallpaper(widget.query);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    searchResults();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchRes = TextEditingController();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5.0,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 234, 228, 228),
                border: Border.all(
                    // color: const Color.fromARGB(255, 19, 106, 22),
                    ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchRes,
                        decoration: InputDecoration(
                          hintText: 'Search Wallpapers',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 76, 75, 75)),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Color.fromARGB(255, 19, 106, 22),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SearchScreen(query: _searchRes.text),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),

            // GridView for displaying wallpapers
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              height: MediaQuery.of(context).size.height * 0.79,
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 7,
                    mainAxisExtent: 400),
                itemCount: searchRes.length,
                itemBuilder: ((context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FullScreen(
                                    imgUrl: searchRes[index].imgSrc)));
                      },
                      child: Hero(
                        tag: searchRes[index].imgSrc,
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
                                searchRes[index].imgSrc),
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
