import 'dart:convert';
import 'dart:ffi';

import 'package:ffi/ffi.dart';

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
typedef CGIncircleFromRadians = CGIncircle Function(Double radians, Double radius);
typedef IncircleFromRadians = CGIncircle Function(double radians, double radius);
typedef CGIncircleFromSize = CGIncircle Function(Double width, Double height, Double radius, Bool avoidOffset);
typedef IncircleFromSize = CGIncircle Function(double width, double height, double radius, bool avoidOffset);
typedef CGIncircleShift = CGIncircle Function(CGIncircle incircle, Double dx, Double dy);
typedef IncircleShift = CGIncircle Function(CGIncircle incircle, double dx, double dy);
typedef CGIncircleToJson = Pointer<Uint8> Function(CGIncircle incircle);
typedef IncircleToJson = Pointer<Uint8> Function(CGIncircle incircle);

final graphical = dlopenPlatformSpecific(
  'graphical',
  path: '/Users/changlei/CLionProjects/graphical/lib/',
);

class CGOffset extends Struct {
  factory CGOffset(double dx, double dy) {
    return calloc<CGOffset>().ref
      ..dx = dx
      ..dy = dy;
  }

  factory CGOffset.fromPointer(Pointer<CGOffset> pointer) {
    return pointer.ref;
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

class CGSize extends Struct {
  factory CGSize(double width, double height) {
    return calloc<CGSize>().ref
      ..width = width
      ..height = height;
  }

  factory CGSize.fromPointer(Pointer<CGSize> pointer) {
    return pointer.ref;
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

class CGRect extends Struct {
  factory CGRect(double left, double top, double right, double bottom) {
    return calloc<CGRect>().ref
      ..left = left
      ..top = top
      ..right = right
      ..bottom = bottom;
  }

  factory CGRect.fromPointer(Pointer<CGRect> pointer) {
    return pointer.ref;
  }

  @Double()
  external double left;
  @Double()
  external double top;
  @Double()
  external double right;
  @Double()
  external double bottom;
  external CGSize size;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CGRect &&
          runtimeType == other.runtimeType &&
          left == other.left &&
          top == other.top &&
          right == other.right &&
          bottom == other.bottom &&
          size == other.size;

  @override
  int get hashCode => left.hashCode ^ top.hashCode ^ right.hashCode ^ bottom.hashCode ^ size.hashCode;

  @override
  String toString() {
    return 'CGRect{left: ${left.toStringAsFixed(4)}, top: ${top.toStringAsFixed(4)}, '
        'right: ${right.toStringAsFixed(4)}, bottom: ${bottom.toStringAsFixed(4)}, size: $size}';
  }
}

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
    return Graphical.shift(this, dx, dy);
  }

  String toJson() {
    return Graphical.toJson(this);
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

  static CGIncircle fromRadians(double radians, double radius) {
    return graphical.lookupFunction<CGIncircleFromRadians, IncircleFromRadians>('Incircle_fromRadians')(
      radians,
      radius,
    );
  }

  static CGIncircle fromSize(double width, double height, double radius, bool avoidOffset) {
    return graphical.lookupFunction<CGIncircleFromSize, IncircleFromSize>('Incircle_fromSize')(
      width,
      height,
      radius,
      avoidOffset,
    );
  }

  static CGIncircle shift(CGIncircle incircle, double dx, double dy) {
    return graphical.lookupFunction<CGIncircleShift, IncircleShift>('Incircle_shift')(incircle, dx, dy);
  }

  static String toJson(CGIncircle incircle) {
    return graphical
        .lookupFunction<CGIncircleToJson, IncircleToJson>('Incircle_toJson')(incircle)
        .cast<Utf8>()
        .toDartString();
  }
}
