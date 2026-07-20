import 'package:flutter/cupertino.dart';
import 'package:wmm/Util/vec2.dart';

class UtilTransform extends ChangeNotifier {
  UtilVec2 position = UtilVec2(0, 0);
  UtilVec2 scale = UtilVec2(1, 1);
  double rotation = 0.0;

  void setPosition(double x,double y) {
    position.x = x;
    position.y = y;
    notifyListeners();
  }
}