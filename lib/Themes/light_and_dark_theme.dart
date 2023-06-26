import 'package:flutter/material.dart';

class LightOn extends StatelessWidget {
  const LightOn({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(),
        onPressed: () {},
        child: Image.asset("assets/images/light_on.png"));
  }
}

class LightOff extends StatelessWidget {
  const LightOff({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(),
        onPressed: () {},
        child: Image.asset("assets/images/light_off.png"));
  }
}
