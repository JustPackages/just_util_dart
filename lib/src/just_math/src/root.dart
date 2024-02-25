import "dart:math" as math;

/// This return "x root y" which the value's y square is x.
num root(num x, num y) {
  return math.pow(math.e, math.log(x) / y);
}
