import 'package:flutter/material.dart';
import 'package:wallartistry/views/widgets/cat_block.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

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
                style: TextStyle(color: Colors.amber, fontSize: 25.0),
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 234, 228, 228),
              border: Border.all(
                color: const Color.fromARGB(255, 19, 106, 22),
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Wallpapers',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 76, 75, 75)),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: const Color.fromARGB(255, 19, 106, 22),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('Search');
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 30,
                itemBuilder: (context, index) => CatBlock()),
          )
        ],
      ),
    );
  }
}
