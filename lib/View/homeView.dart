import 'package:flutter/material.dart';
import '../Controller/homeController.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _controller.PushBoardListView(context);
              },
              child: const Text('ホワイトボード一覧へ'),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('ホワイトボードを作成する')),
          ],
        ),
      ),
    );
  }
}
