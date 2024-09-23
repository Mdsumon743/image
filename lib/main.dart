import 'package:flutter/material.dart';
import 'package:save/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Save',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Homepage(),
    );
  }
}
