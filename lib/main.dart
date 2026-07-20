import 'package:flutter/material.dart';
import 'package:wmm/Assets/assetsManager.dart';
import 'package:wmm/Assets/noteProject.dart';
import 'View/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late AssetsManager assetsManager;
  MyApp({super.key}) {
    assetsManager = AssetsManager();
    assetsManager.noteProject.addMemo(100,500);
    assetsManager.noteProject.addMemo(400,300);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(assetsManager),
    );
  }
}
