import 'package:flutter/material.dart';

import '../pages/sign_page.dart';
import '../theme.dart';

const appName = "Citis";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        colorScheme: const CitisColorScheme(),
        textTheme: CitisTextTheme(),
        useMaterial3: true,
      ),
      home: const SignPage(),
    );
  }
}
