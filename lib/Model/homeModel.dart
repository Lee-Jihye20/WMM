import 'package:flutter/material.dart';

class HomeModel {
  String? name;
  int count;
  HomeModel({this.name, this.count = 0});
  void increment() {
    count += 1;
  }
}
