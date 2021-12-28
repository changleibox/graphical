import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'ffi.dart';

typedef CGOffsetInit = CGOffset Function(Double dx, Double dy);
typedef OffsetInit = CGOffset Function(double dx, double dy);
typedef CGOffsetFromDirection = CGOffset Function(Double direction, Double distance);
typedef OffsetFromDirection = CGOffset Function(double direction, double distance);
typedef CGOffsetRotation = CGOffset Function(CGOffset offset, Double radius);
typedef OffsetRotation = CGOffset Function(CGOffset offset, double radius);

/// Created by changlei on 2021/12/28.
///
/// Offset
class CGOffset extends Struct {
  factory CGOffset(double dx, double dy) {
    return calloc<CGOffset>().ref
      ..dx = dx
      ..dy = dy;
  }

  factory CGOffset.fromPointer(Pointer<CGOffset> pointer) {
    return pointer.ref;
  }

  static CGOffset init(double dx, double dy) {
    return graphical.lookupFunction<CGOffsetInit, OffsetInit>('Offset_init')(dx, dy);
  }

  static CGOffset fromDirection(double direction, {double distance = 1}) {
    return graphical.lookupFunction<CGOffsetFromDirection, OffsetFromDirection>('Offset_fromDirection')(
      direction,
      distance,
    );
  }

  @Double()
  external double dx;
  @Double()
  external double dy;
  @Double()
  external double distance;
  @Double()
  external double distanceSquared;
  @Double()
  external double direction;

  CGOffset rotationX(double radius) {
    return graphical.lookupFunction<CGOffsetRotation, OffsetRotation>('Offset_rotationX')(this, radius);
  }

  CGOffset rotationY(double radius) {
    return graphical.lookupFunction<CGOffsetRotation, OffsetRotation>('Offset_rotationY')(this, radius);
  }

  CGOffset rotationZ(double radius) {
    return graphical.lookupFunction<CGOffsetRotation, OffsetRotation>('Offset_rotationZ')(this, radius);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CGOffset && runtimeType == other.runtimeType && dx == other.dx && dy == other.dy;

  @override
  int get hashCode => dx.hashCode ^ dy.hashCode;

  @override
  String toString() {
    return 'CGOffset{dx: $dx, dy: $dy}';
  }
}
