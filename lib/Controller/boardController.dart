import "../Model/boardModel.dart";
import "package:flutter/material.dart";
import "../Model/Util/Card.dart";

class BoardController {
  final int boardId;
  late final BoardModel _model;

  BoardController({required this.boardId}) {
    _model = BoardModel(boardId: boardId); // 受け取った値をModelへ
  }

  // Modelの値をViewに公開したいならゲッターを用意
  int get id => _model.boardId;
  Widget board_buildCard(CardModel card) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.yellow[100],
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(card.title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(card.contents ?? ''),
        ],
      ),
    );
  }
}
