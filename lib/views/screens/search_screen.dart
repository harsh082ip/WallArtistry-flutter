import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key});

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
                    const Expanded(
                      child: TextField(
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
                        print('Search');
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
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 7,
                    mainAxisExtent: 400),
                itemCount: 20,
                itemBuilder: ((context, index) => Container(
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
                            'https://images.pexels.com/photos/10394779/pexels-photo-10394779.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
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
