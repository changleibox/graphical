import 'src/native.dart';

void main(List<String> arguments) {
  print([
    Graphical.cornerPath(100, 100, 8),
    Graphical.radians90,
    Graphical.radians180,
    Graphical.radians270,
    Graphical.radians360,
    Graphical.pi,
    Graphical.fromSize(80, 80, 4, false),
    Graphical.fromRadians(1, 4),
  ].join('\n'));
}
