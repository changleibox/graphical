import 'dart:convert';
import 'dart:ffi';

import 'ffi.dart';

typedef CGCornerPath = Pointer<Int8> Function(
  Double width,
  Double height,
  Double radius,
  Double blRadius,
  Double brRadius,
  Bool avoidOffset,
);
typedef CornerPath = Pointer<Int8> Function(
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

  static final pi = Graphical._radians('pi');

  static final radians180 = Graphical._radians('radians180');

  static final radians90 = Graphical._radians('radians90');

  static final radians270 = Graphical._radians('radians270');

  static final radians360 = Graphical._radians('radians360');

  static Map<String, dynamic> cornerPath(
    double width,
    double height,
    double radius, {
    double? blRadius,
    double? brRadius,
    bool avoidOffset = false,
  }) {
    final result = graphical.lookupFunction<CGCornerPath, CornerPath>('cornerPath')(
      width,
      height,
      radius,
      blRadius ?? radius,
      brRadius ?? radius,
      avoidOffset,
    );
    return json.decode(result.string) as Map<String, dynamic>;
  }

  static double _radians(String symbolName) {
    return graphical.lookupFunction<CGRadians, Radians>(symbolName).call();
  }
}
