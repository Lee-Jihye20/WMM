import "package:flutter/material.dart";
import 'package:wmm/View/boardView.dart';

class BoardListController {
  void PushBoardView(BuildContext context, int boardId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BoardView(boardId: boardId)),
    );
  }

  void viewBoards() {
    // Logic to view existing boards
    print("Viewing existing boards...");
  }
}
