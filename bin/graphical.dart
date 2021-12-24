import 'src/native.dart';

void main(List<String> arguments) {
  final graphical = Graphical();
  final path = graphical.cornerPath(100, 100, 8);
  print(path);
}
