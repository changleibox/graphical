import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'ffi.dart';
import 'offset.dart';
import 'rect.dart';
import 'size.dart';

typedef CGIncircleFromRadians = CGIncircle Function(Double radians, Double radius);
typedef IncircleFromRadians = CGIncircle Function(double radians, double radius);
typedef CGIncircleFromSize = CGIncircle Function(CGSize size, Double radius, Bool avoidOffset);
typedef IncircleFromSize = CGIncircle Function(CGSize size, double radius, bool avoidOffset);
typedef CGIncircleShift = CGIncircle Function(CGIncircle incircle, CGOffset offset);
typedef IncircleShift = CGIncircle Function(CGIncircle incircle, CGOffset offset);
typedef CGIncircleRotation = CGIncircle Function(CGIncircle incircle, Double radians);
typedef IncircleRotation = CGIncircle Function(CGIncircle incircle, double radians);
typedef CGIncircleFlipped = CGIncircle Function(CGIncircle incircle);
typedef IncircleFlipped = CGIncircle Function(CGIncircle incircle);
typedef CGIncircleToJson = Pointer<Int8> Function(CGIncircle incircle);
typedef IncircleToJson = Pointer<Int8> Function(CGIncircle incircle);
typedef CGIncircleCorrectRadians = Double Function(Double radians);
typedef IncircleCorrectRadians = double Function(double radians);
typedef CGIncircleOffsetOf = Double Function(CGSize size, Double radians);
typedef IncircleOffsetOf = double Function(CGSize size, double radians);
typedef CGIncircleCenterOf = CGOffset Function(CGOffset point1, CGOffset point2, CGOffset point3);
typedef IncircleCenterOf = CGOffset Function(CGOffset point1, CGOffset point2, CGOffset point3);

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

  static CGIncircle fromSize(CGSize size, double radius, {bool avoidOffset = false}) {
    return graphical.lookupFunction<CGIncircleFromSize, IncircleFromSize>('Incircle_fromSize')(
      size,
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

  CGIncircle shift(CGOffset offset) {
    return graphical.lookupFunction<CGIncircleShift, IncircleShift>('Incircle_shift')(this, offset);
  }

  CGIncircle rotationX(double radians) {
    return graphical.lookupFunction<CGIncircleRotation, IncircleRotation>('Incircle_rotationX')(this, radians);
  }

  CGIncircle rotationY(double radians) {
    return graphical.lookupFunction<CGIncircleRotation, IncircleRotation>('Incircle_rotationY')(this, radians);
  }

  CGIncircle rotationZ(double radians) {
    return graphical.lookupFunction<CGIncircleRotation, IncircleRotation>('Incircle_rotationZ')(this, radians);
  }

  CGIncircle get flipped {
    return graphical.lookupFunction<CGIncircleFlipped, IncircleFlipped>('Incircle_flipped')(this);
  }

  static double correctRadians(double radians) {
    return graphical.lookupFunction<CGIncircleCorrectRadians, IncircleCorrectRadians>('Incircle_correctRadians')(
      radians,
    );
  }

  static double offsetOf(CGSize size, double radians) {
    return graphical.lookupFunction<CGIncircleOffsetOf, IncircleOffsetOf>('Incircle_offsetOf')(size, radians);
  }

  static CGOffset centerOf(CGOffset point1, CGOffset point2, CGOffset point3) {
    return graphical.lookupFunction<CGIncircleCenterOf, IncircleCenterOf>('Incircle_centerOf')(point1, point2, point3);
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
