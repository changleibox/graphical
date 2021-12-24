import 'dart:convert';
import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';

typedef CCornerPath = ffi.Pointer<ffi.Int8> Function(
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

final _library = ffi.DynamicLibrary.open('/Users/changlei/CLionProjects/graphical/lib/libgraphical.dylib');

/// Created by changlei on 2021/12/24.
class Graphical {
  final _cornerPath = _library.lookupFunction<CCornerPath, CornerPath>('cornerPath');

  Map<String, dynamic> cornerPath(
    double width,
    double height,
    double radius, {
    double? blRadius,
    double? brRadius,
    bool avoidOffset = false,
  }) {
    final result = _cornerPath(
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
}
