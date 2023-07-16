import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
