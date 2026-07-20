class Board {
  final int id;
  final String title;
  final String? createdAt;

  Board({required this.id, required this.title, this.createdAt});

  // DBのMap → Board オブジェクトに変換
  factory Board.fromMap(Map<String, dynamic> map) {
    return Board(
      id: map['id'] as int,
      title: map['title'] as String,
      createdAt: map['createdAt'] as String?,
    );
  }

  // Board → Map に変換（insert/update用）
  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'createdAt': createdAt};
  }
}
