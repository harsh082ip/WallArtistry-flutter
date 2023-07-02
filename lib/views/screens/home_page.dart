import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:wallartistry/controllers/api.dart';
import 'package:wallartistry/models/photosModel.dart';
import 'package:wallartistry/views/screens/full_screen.dart';
import 'package:wallartistry/views/screens/search_screen.dart';
import 'package:wallartistry/views/widgets/cat_block.dart';
import 'package:wallartistry/main.dart';
import '../../models/categoryModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<PhotosModel> trendingWallList = [];

  getTrendingWallpapers() async {
    trendingWallList = await APIs.getWallpapers();
    setState(() {});
  }

  late List<CategoryModel> CatModList = [];
  bool isLoading = true;

  GetCatDetails() async {
    CatModList = await APIs.getCategoriesList();
    print("GETTTING CAT MOD LIST");
    print(CatModList);
    setState(() {
      CatModList = CatModList;
      isLoading = false;
    });
  }

  @override
  void initState() {
    print('init called');
    super.initState();
    getTrendingWallpapers();
    GetCatDetails();
  }

  List<String> catNames = [
    'bikes',
    'cars',
    'nature',
    'plants',
    'snow',
    'couple',
    'friends',
    'animals',
    'ocean'
  ];

  bool isDarkTheme = false; // Track the current theme
  int imageIndex = 0; // Track the current image index

  int themeCount = 0;

  @override
  static TextEditingController _searchController = TextEditingController();
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      // AppBar
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
        actions: [
          IconButton(
            onPressed: () {
              themeCount++;

              setState(() {});
            },
            icon: (themeCount % 2 != 0)
                ? Image.asset('assets/images/light_off.png')
                : Image.asset('assets/images/light_on.png'),
          ),
        ],
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
                      // search box
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SearchScreen(query: _searchController.text),
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
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 44, 172, 49),
                    ),
                  )
                : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: CatModList.length,
                        itemBuilder: (context, index) => CatBlock(
                              categoryImgSrc: CatModList[index].catImgUrl,
                              categoryName: CatModList[index].catName,
                            )),
                  ),

            // GridView for displaying wallpapers
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              height: MediaQuery.of(context).size.height * 0.69,
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 7,
                    mainAxisExtent: 400),
                itemCount: trendingWallList.length,
                itemBuilder: ((context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FullScreen(
                                    imgUrl: trendingWallList[index].imgSrc)));
                      },
                      child: Hero(
                        tag: trendingWallList[index].imgSrc,
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
                                trendingWallList[index].imgSrc),
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
