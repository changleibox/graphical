import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'ffi.dart';

typedef CGSizeInit = CGSize Function(Double width, Double height);
typedef SizeInit = CGSize Function(double width, double height);
typedef CGSizeSquare = CGSize Function(Double dimension);
typedef SizeSquare = CGSize Function(double dimension);

/// Created by changlei on 2021/12/28.
///
/// Size
class CGSize extends Struct {
  factory CGSize(double width, double height) {
    return calloc<CGSize>().ref
      ..width = width
      ..height = height;
  }

  factory CGSize.fromPointer(Pointer<CGSize> pointer) {
    return pointer.ref;
  }

  static CGSize init(double width, double height) {
    return graphical.lookupFunction<CGSizeInit, SizeInit>('Size_init')(width, height);
  }

  static CGSize square(double dimension) {
    return graphical.lookupFunction<CGSizeSquare, SizeSquare>('Size_square')(dimension);
  }

  @Double()
  external double width;
  @Double()
  external double height;
  @Double()
  external double direction;
  @Double()
  external double radians;
  @Double()
  external double distance;
  @Double()
  external double semiRadians;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CGSize &&
          runtimeType == other.runtimeType &&
          width == other.width &&
          height == other.height &&
          direction == other.direction &&
          radians == other.radians &&
          distance == other.distance &&
          semiRadians == other.semiRadians;

  @override
  int get hashCode =>
      width.hashCode ^
      height.hashCode ^
      direction.hashCode ^
      radians.hashCode ^
      distance.hashCode ^
      semiRadians.hashCode;

  @override
  String toString() {
    return 'CGSize{width: ${width.toStringAsFixed(4)}, height: ${height.toStringAsFixed(4)}, '
        'direction: ${direction.toStringAsFixed(4)}, radians: ${radians.toStringAsFixed(4)}, '
        'distance: ${distance.toStringAsFixed(4)}, semiRadians: ${semiRadians.toStringAsFixed(4)}}';
  }
}
