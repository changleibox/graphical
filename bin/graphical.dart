import 'src/incircle.dart';
import 'src/native.dart';

void main(List<String> arguments) {
  print([
    Graphical.cornerPath(100.0, 100.0, 8.0),
    Graphical.radians90,
    Graphical.radians180,
    Graphical.radians270,
    Graphical.radians360,
    Graphical.pi,
    CGIncircle.fromSize(80.0, 80.0, 4.0).shift(10, 10).toJson(),
    CGIncircle.fromRadians(1.0, 4.0).shift(10, 10).toJson(),
  ].join('\n'));
}
