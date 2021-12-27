import 'src/native.dart';

void main(List<String> arguments) {
  print([
    Graphical.cornerPath(100, 100, 8),
    Graphical.radians90,
    Graphical.radians180,
    Graphical.radians270,
    Graphical.radians360,
    Graphical.pi,
  ].join('\n'));
}
