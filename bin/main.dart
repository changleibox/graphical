import 'src/graphical.dart';
import 'src/incircle.dart';
import 'src/offset.dart';
import 'src/size.dart';

void main(List<String> arguments) {
  print([
    Graphical.cornerPath(100.0, 100.0, 8.0),
    Graphical.radians90,
    Graphical.radians180,
    Graphical.radians270,
    Graphical.radians360,
    Graphical.pi,
    CGIncircle.fromSize(CGSize.square(80), 4.0).shift(CGOffset.init(10, 10)).toJson(),
    CGIncircle.fromRadians(1.0, 4.0).shift(CGOffset.init(10, 10)).toJson(),
  ].join('\n'));
}
