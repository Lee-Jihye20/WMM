import "package:flutter/material.dart";
import "../Model/Util/Card.dart";
import "../Model/Util/cardRepository.dart";
import "../Controller/boardController.dart";

class BoardView extends StatefulWidget {
  final int boardId;
  const BoardView({super.key, required this.boardId});

  @override
  State<BoardView> createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {
  final CardRepository _cardRepo = CardRepository();
  late Future<List<CardModel>> _cardsFuture;
  final TransformationController _transformController =
      TransformationController();
  late final BoardController _controller;

  // 現在の座標
  double _offsetX = 0;
  double _offsetY = 0;

  @override
  void initState() {
    super.initState();
    _controller = BoardController(boardId: widget.boardId);
    _cardsFuture = _cardRepo.getAll(); // 一時的に全件

    // initStateで件数も出す
    _cardRepo.getAll().then((list) => print('cards全件: ${list.length}'));
    _cardsFuture = _cardRepo.getByBoard(widget.boardId);

    // 動くたびに座標を更新
    _transformController.addListener(() {
      final matrix = _transformController.value;
      setState(() {
        _offsetX = matrix.getTranslation().x;
        _offsetY = matrix.getTranslation().y;
      });
    });
  }

  @override
  void dispose() {
    _transformController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Board ${widget.boardId}')),
      body: Stack(
        children: [
          FutureBuilder<List<CardModel>>(
            future: _cardsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              final cards = snapshot.data ?? [];
              // print('取得したカード数: ${cards.length}'); // コンソールで確認

              if (cards.isEmpty) {
                return const Center(child: Text('カードが0枚です'));
              }
              return InteractiveViewer(
                transformationController: _transformController, // ← 追加
                constrained: false,
                boundaryMargin: const EdgeInsets.all(2000),
                minScale: 0.5,
                maxScale: 3.0,
                child: SizedBox(
                  width: 3000,
                  height: 3000,
                  child: Stack(
                    children: cards.map((card) {
                      return Positioned(
                        left: card.x.toDouble(),
                        top: card.y.toDouble(),
                        child: _controller.board_buildCard(card),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),

          // 右下の座標表示
          Positioned(
            right: 12,
            bottom: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'X: ${_offsetX.toStringAsFixed(0)}  Y: ${_offsetY.toStringAsFixed(0)}',
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
