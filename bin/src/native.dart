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
typedef CGFromRadians = CGIncircle Function(ffi.Double radians, ffi.Double radius);
typedef FromRadians = CGIncircle Function(double radians, double radius);
typedef CGFromSize = CGIncircle Function(ffi.Double width, ffi.Double height, ffi.Double radius, ffi.Bool avoidOffset);
typedef FromSize = CGIncircle Function(double width, double height, double radius, bool avoidOffset);

final graphical = dlopenPlatformSpecific(
  'graphical',
  path: '/Users/changlei/CLionProjects/graphical/lib/',
);

class CGOffset extends ffi.Struct {
  factory CGOffset(double dx, double dy) {
    return calloc<CGOffset>().ref
      ..dx = dx
      ..dy = dy;
  }

  factory CGOffset.fromPointer(ffi.Pointer<CGOffset> pointer) {
    return pointer.ref;
  }

  @ffi.Double()
  external double dx;
  @ffi.Double()
  external double dy;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CGOffset && runtimeType == other.runtimeType && dx == other.dx && dy == other.dy;

  @override
  int get hashCode => dx.hashCode ^ dy.hashCode;

  @override
  String toString() {
    return 'CGOffset{dx: ${dx.toStringAsFixed(2)}, dy: ${dy.toStringAsFixed(2)}}';
  }
}

class CGSize extends ffi.Struct {
  factory CGSize(double width, double height) {
    return calloc<CGSize>().ref
      ..width = width
      ..height = height;
  }

  factory CGSize.fromPointer(ffi.Pointer<CGSize> pointer) {
    return pointer.ref;
  }

  @ffi.Double()
  external double width;
  @ffi.Double()
  external double height;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CGSize && runtimeType == other.runtimeType && width == other.width && height == other.height;

  @override
  int get hashCode => width.hashCode ^ height.hashCode;

  @override
  String toString() {
    return 'CGSize{width: ${width.toStringAsFixed(2)}, height: ${height.toStringAsFixed(2)}}';
  }
}

class CGRect extends ffi.Struct {
  factory CGRect(double left, double top, double right, double bottom) {
    return calloc<CGRect>().ref
      ..left = left
      ..top = top
      ..right = right
      ..bottom = bottom;
  }

  factory CGRect.fromPointer(ffi.Pointer<CGRect> pointer) {
    return pointer.ref;
  }

  @ffi.Double()
  external double left;
  @ffi.Double()
  external double top;
  @ffi.Double()
  external double right;
  @ffi.Double()
  external double bottom;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CGRect &&
          runtimeType == other.runtimeType &&
          left == other.left &&
          top == other.top &&
          right == other.right &&
          bottom == other.bottom;

  @override
  int get hashCode => left.hashCode ^ top.hashCode ^ right.hashCode ^ bottom.hashCode;

  @override
  String toString() {
    return 'CGRect{left: ${left.toStringAsFixed(2)}, top: ${top.toStringAsFixed(2)}, right: ${right.toStringAsFixed(2)}, bottom: ${bottom.toStringAsFixed(2)}}';
  }
}

class CGIncircle extends ffi.Struct {
  factory CGIncircle(CGOffset begin, CGOffset middle, CGOffset end, CGOffset center) {
    return calloc<CGIncircle>().ref
      ..begin = begin
      ..middle = middle
      ..end = end
      ..center = center;
  }

  factory CGIncircle.fromPointer(ffi.Pointer<CGIncircle> pointer) {
    return pointer.ref;
  }

  external CGOffset begin;
  external CGOffset middle;
  external CGOffset end;
  external CGOffset center;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CGIncircle &&
          runtimeType == other.runtimeType &&
          begin == other.begin &&
          middle == other.middle &&
          end == other.end &&
          center == other.center;

  @override
  int get hashCode => begin.hashCode ^ middle.hashCode ^ end.hashCode ^ center.hashCode;

  @override
  String toString() {
    return 'CGIncircle{begin: $begin, middle: $middle, end: $end, center: $center}';
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
    return graphical.lookupFunction<CGFromRadians, FromRadians>('fromRadians')(radians, radius);
  }

  static CGIncircle fromSize(double width, double height, double radius, bool avoidOffset) {
    return graphical.lookupFunction<CGFromSize, FromSize>('fromSize')(width, height, radius, avoidOffset);
  }
}
