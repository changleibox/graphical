import 'src/native.dart';

void main(List<String> arguments) {
  print([
    Graphical.cornerPath(100.0, 100.0, 8.0),
    Graphical.radians90,
    Graphical.radians180,
    Graphical.radians270,
    Graphical.radians360,
    Graphical.pi,
    Graphical.fromSize(80.0, 80.0, 4.0, false),
    Graphical.fromRadians(1.0, 4.0),
  ].join('\n'));
}
