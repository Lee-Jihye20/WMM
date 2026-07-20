import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wmm/Assets/assetsManager.dart';
import 'package:wmm/Assets/noteProject.dart';
import 'package:wmm/Controller/mainController.dart';
import 'package:wmm/View/container.dart';

class HomeView extends StatelessWidget {
  MainController mainController = MainController();
  late AssetsManager assetsManager;

  HomeView(AssetsManager assetsManager, {super.key}) {
    this.assetsManager = assetsManager;
    mainController.setProject(assetsManager.noteProject);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListenableBuilder(
        listenable: assetsManager.noteProject,
        builder: (context, child) {
          return Stack(
            fit: StackFit.expand,
            children: [
              TextButton(
                onPressed: () => assetsManager.noteProject.addMemo(Random().nextDouble() * 500,Random().nextDouble() * 500),
                child: const Text('click here'),
              ),
              for (var container in assetsManager.noteProject.containers)
                MemoCard(container: container),
            ],
          );
        },
      ),
    );
  }
}
