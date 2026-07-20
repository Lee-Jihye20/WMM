import 'package:wmm/Assets/noteProject.dart';
import 'package:wmm/Model/Container.dart';

class Commandcontroller {
  NoteProject project = NoteProject();

  void addMemo(double x, double y) {
    ModelContainer container = ModelContainer();
    container.transform.setPosition(x,y);
    project.containers.add(container);
  }

  void removeMemo() {
  }
}