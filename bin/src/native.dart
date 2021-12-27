import 'dart:convert';
import 'dart:ffi' as ffi;

import 'package:ffi/ffi.dart';

import 'ffi.dart';

typedef CGCornerPath = ffi.Pointer<ffi.Int8> Function(
  ffi.Double width,
  ffi.Double height,
  ffi.Double radius,
  ffi.Double blRadius,
  ffi.Double brRadius,
  ffi.Bool avoidOffset,
);
typedef CornerPath = ffi.Pointer<ffi.Int8> Function(
  double width,
  double height,
  double radius,
  double blRadius,
  double brRadius,
  bool avoidOffset,
);
typedef CGRadians = ffi.Double Function();
typedef Radians = double Function();

final graphical = dlopenPlatformSpecific('/Users/changlei/CLionProjects/graphical/lib/libgraphical.dylib');

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
    final jsonStr = result.cast<Utf8>().toDartString();
    return json.decode(jsonStr) as Map<String, dynamic>;
  }

  static double _radians(String symbolName) {
    return graphical.lookupFunction<CGRadians, Radians>(symbolName).call();
  }
}
