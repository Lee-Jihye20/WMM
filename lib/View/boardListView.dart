import 'package:flutter/material.dart';
import '../Model/Util/Board.dart';
import '../Model/Util/BoardRepository.dart';
import 'boardView.dart';

class BoardListView extends StatefulWidget {
  const BoardListView({super.key});

  @override
  State<BoardListView> createState() => _BoardListViewState();
}

class _BoardListViewState extends State<BoardListView> {
  final BoardRepository _repository = BoardRepository();
  late Future<List<Board>> _boardsFuture;

  @override
  void initState() {
    super.initState();
    _boardsFuture = _repository.getAll(); // DBから取得
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Board List')),
      body: FutureBuilder<List<Board>>(
        future: _boardsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('エラー: ${snapshot.error}'));
          }
          final boards = snapshot.data ?? [];
          if (boards.isEmpty) {
            return const Center(child: Text('ボードがありません'));
          }
          return ListView.builder(
            itemCount: boards.length,
            itemBuilder: (context, index) {
              final board = boards[index];
              return Row(
                children: [
                  Expanded(child: Text(board.title)),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BoardView(boardId: board.id), // idを渡す
                          ),
                        );
                      },
                      child: const Text('開く'),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
