import 'package:citis/pages/sign_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const appName = "Citis";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignPage(),
    );
  }
}
