import 'package:flutter/cupertino.dart';
import 'package:wmm/Model/Container.dart';

class NoteProject extends ChangeNotifier {
  late List<ModelContainer> containers;

  NoteProject() {
    containers = [];
  }

  void addMemo(double x, double y) {
    ModelContainer container = ModelContainer();
    container.transform.setPosition(x,y);
    containers.add(container);
    notifyListeners();
  }
}