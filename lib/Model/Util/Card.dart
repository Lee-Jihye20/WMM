import 'package:flutter/material.dart';

class CardModel {
  final int id;
  final int boardId;
  final String title;
  final String? contents; // ← null許容
  final int x;
  final int y;
  final String? createdAt; // ← null許容

  CardModel({
    required this.id,
    required this.boardId,
    required this.title,
    this.contents, // requiredを外す
    required this.x,
    required this.y,
    this.createdAt,
  });

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      id: map['id'] as int,
      boardId: map['boardId'] as int,
      title: map['title'] as String,
      contents: map['contents'] as String?, // ← ? を付ける
      x: map['x'] as int,
      y: map['y'] as int,
      createdAt: map['createdAt'] as String?, // createdAtも?にしておくと安全
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'boardId': boardId,
      'title': title,
      'Container': Container,
      'x': x,
      'y': y,
      'createdAt': createdAt,
    };
  }
}
