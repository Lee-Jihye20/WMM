import 'package:flutter/material.dart';
import '../Model/homeModel.dart';
import '../View/boardListView.dart';

class HomeController extends ChangeNotifier {
  final HomeModel _model = HomeModel(name: 'User');

  void PushBoardListView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BoardListView()),
    );
  }
}
