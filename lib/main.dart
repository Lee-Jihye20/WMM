import 'package:flutter/material.dart';
import 'View/homeView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ← MaterialApp はここに1つだけ
      title: 'WMM',
      home: HomeView(),
    );
  }
}
