import 'package:flutter/material.dart';
import 'screens/hello_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GreenSpace',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Comfortaa',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5A8D61),
          primary: const Color(0xFF5A8D61),
        ),
        useMaterial3: true,
      ),
      home: const HelloScreen(),
    );
  }
}

