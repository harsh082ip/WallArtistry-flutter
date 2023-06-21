import 'package:flutter/material.dart';
import 'package:wallartistry/views/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtain the current system brightness mode
    final Brightness systemBrightness =
        MediaQuery.platformBrightnessOf(context);

    // Define your theme data based on the system's brightness
    final ThemeData themeData = systemBrightness == Brightness.dark
        ? ThemeData.dark(useMaterial3: true)
        : ThemeData.light(useMaterial3: true);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const HomePage(),
    );
  }
}