import 'dart:ffi';

import 'ffi.dart';
import 'path.dart';

typedef CGGraphicalCornerPath = CGPath Function(
  Double width,
  Double height,
  Double radius,
  Double blRadius,
  Double brRadius,
  Bool avoidOffset,
);
typedef GraphicalCornerPath = CGPath Function(
  double width,
  double height,
  double radius,
  double blRadius,
  double brRadius,
  bool avoidOffset,
);
typedef CGRadians = Double Function();
typedef Radians = double Function();

/// Created by changlei on 2021/12/24.
class Graphical {
  const Graphical._();

  static final pi = Graphical._radians('Graphical_pi');

  static final radians180 = Graphical._radians('Graphical_radians180');

  static final radians90 = Graphical._radians('Graphical_radians90');

  static final radians270 = Graphical._radians('Graphical_radians270');

  static final radians360 = Graphical._radians('Graphical_radians360');

  static CGPath cornerPath(
    double width,
    double height,
    double radius, {
    double? blRadius,
    double? brRadius,
    bool avoidOffset = false,
  }) {
    return graphical.lookupFunction<CGGraphicalCornerPath, GraphicalCornerPath>('Graphical_cornerPath')(
      width,
      height,
      radius,
      blRadius ?? radius,
      brRadius ?? radius,
      avoidOffset,
    );
  }

  static double _radians(String symbolName) {
    return graphical.lookupFunction<CGRadians, Radians>(symbolName).call();
  }
}
