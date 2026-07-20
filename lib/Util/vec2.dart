class UtilVec2 {
  double x;
  double y;

  UtilVec2(this.x, this.y);

  UtilVec2 operator +(UtilVec2 other) => UtilVec2(x + other.x, y + other.y);

  UtilVec2 operator *(double scalar) => UtilVec2(x * scalar, y * scalar);

  double dot(UtilVec2 other) => x * other.x + y * other.y;
}