import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/white_background.png"),
          ),
        ),
        child: Center(
          child: Image.asset(
            "assets/red_citis_logo.png",
            width: 300,
            height: 400,
          ),
        ),
      ),
    );
  }
}
