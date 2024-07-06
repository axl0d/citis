import 'package:citis/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class SignPage extends StatelessWidget {
  const SignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/white_background.png"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Image.asset(
                "assets/ups_logo.png",
                width: 200,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  "assets/red_citis_logo.png",
                  width: 300,
                  height: 400,
                ),
              ),
            ),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: r3,
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.arrow_forward_ios),
                iconAlignment: IconAlignment.end,
                label: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("Registrarse"),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
