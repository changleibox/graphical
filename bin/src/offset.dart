import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'ffi.dart';

typedef CGOffsetInit = CGOffset Function(Double dx, Double dy);
typedef OffsetInit = CGOffset Function(double dx, double dy);

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

  @Double()
  external double dx;
  @Double()
  external double dy;
  @Double()
  external double distance;
  @Double()
  external double direction;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CGOffset &&
          runtimeType == other.runtimeType &&
          dx == other.dx &&
          dy == other.dy &&
          distance == other.distance &&
          direction == other.direction;

  @override
  int get hashCode => dx.hashCode ^ dy.hashCode ^ distance.hashCode ^ direction.hashCode;

  @override
  String toString() {
    return 'CGOffset{dx: ${dx.toStringAsFixed(4)}, dy: ${dy.toStringAsFixed(4)}, '
        'distance: ${distance.toStringAsFixed(4)}, direction: ${direction.toStringAsFixed(4)}}';
  }
}
