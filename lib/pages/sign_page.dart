import 'package:citis/pages/home_page.dart';
import 'package:flutter/material.dart';

class SignPage extends StatelessWidget {
  const SignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFcf2e2e),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset("assets/logo.png"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            ),
            child: const Text("Iniciar sesión con Google"),
          ),
        ],
      ),
    );
  }
}
