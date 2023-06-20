import 'package:flutter/material.dart';

class CatBlock extends StatelessWidget {
  const CatBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60.0),
            child: Image.network(
                height: 80,
                width: 80,
                fit: BoxFit.cover,
                'https://images.pexels.com/photos/39501/lamborghini-brno-racing-car-automobiles-39501.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(60.0)),
          ),
          const Positioned(
            left: 12,
            top: 25,
            child: Text(
              'Cars',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
