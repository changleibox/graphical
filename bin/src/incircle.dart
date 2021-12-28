import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'ffi.dart';
import 'offset.dart';
import 'rect.dart';

typedef CGIncircleFromRadians = CGIncircle Function(Double radians, Double radius);
typedef IncircleFromRadians = CGIncircle Function(double radians, double radius);
typedef CGIncircleFromSize = CGIncircle Function(Double width, Double height, Double radius, Bool avoidOffset);
typedef IncircleFromSize = CGIncircle Function(double width, double height, double radius, bool avoidOffset);
typedef CGIncircleShift = CGIncircle Function(CGIncircle incircle, Double dx, Double dy);
typedef IncircleShift = CGIncircle Function(CGIncircle incircle, double dx, double dy);
typedef CGIncircleToJson = Pointer<Int8> Function(CGIncircle incircle);
typedef IncircleToJson = Pointer<Int8> Function(CGIncircle incircle);

/// Created by changlei on 2021/12/28.
///
/// Incircle
class CGIncircle extends Struct {
  factory CGIncircle(CGOffset begin, CGOffset middle, CGOffset end, CGOffset center) {
    return calloc<CGIncircle>().ref
      ..begin = begin
      ..middle = middle
      ..end = end
      ..center = center;
  }

  factory CGIncircle.fromPointer(Pointer<CGIncircle> pointer) {
    return pointer.ref;
  }

  static CGIncircle fromRadians(double radians, double radius) {
    return graphical.lookupFunction<CGIncircleFromRadians, IncircleFromRadians>('Incircle_fromRadians')(
      radians,
      radius,
    );
  }

  static CGIncircle fromSize(double width, double height, double radius, {bool avoidOffset = false}) {
    return graphical.lookupFunction<CGIncircleFromSize, IncircleFromSize>('Incircle_fromSize')(
      width,
      height,
      radius,
      avoidOffset,
    );
  }

  external CGOffset begin;
  external CGOffset middle;
  external CGOffset end;
  external CGOffset center;
  @Double()
  external double radius;
  @Double()
  external double radians;
  @Double()
  external double rotation;
  external CGOffset vertex;
  external CGRect circle;
  external CGRect bounds;

  CGIncircle shift(double dx, double dy) {
    return graphical.lookupFunction<CGIncircleShift, IncircleShift>('Incircle_shift')(this, dx, dy);
  }

  String toJson() {
    return graphical.lookupFunction<CGIncircleToJson, IncircleToJson>('Incircle_toJson')(this).string;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CGIncircle &&
          runtimeType == other.runtimeType &&
          begin == other.begin &&
          middle == other.middle &&
          end == other.end &&
          center == other.center &&
          radius == other.radius &&
          radians == other.radians &&
          rotation == other.rotation &&
          vertex == other.vertex &&
          circle == other.circle &&
          bounds == other.bounds;

  @override
  int get hashCode =>
      begin.hashCode ^
      middle.hashCode ^
      end.hashCode ^
      center.hashCode ^
      radius.hashCode ^
      radians.hashCode ^
      rotation.hashCode ^
      vertex.hashCode ^
      circle.hashCode ^
      bounds.hashCode;

  @override
  String toString() {
    return 'CGIncircle{begin: $begin, middle: $middle, end: $end, center: $center, '
        'radius: ${radius.toStringAsFixed(4)}, radians: ${radians.toStringAsFixed(4)}, '
        'rotation: ${rotation.toStringAsFixed(4)}, vertex: $vertex, circle: $circle, bounds: $bounds}';
  }
}
