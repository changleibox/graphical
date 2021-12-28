import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'ffi.dart';
import 'offset.dart';

typedef CGSizeInit = CGSize Function(Double width, Double height);
typedef SizeInit = CGSize Function(double width, double height);
typedef CGSizeCopy = CGSize Function(CGSize size);
typedef SizeCopy = CGSize Function(CGSize size);
typedef CGSizeSquare = CGSize Function(Double dimension);
typedef SizeSquare = CGSize Function(double dimension);
typedef CGSizeFromWidth = CGSize Function(Double width);
typedef SizeFromWidth = CGSize Function(double width);
typedef CGSizeFromHeight = CGSize Function(Double height);
typedef SizeFromHeight = CGSize Function(double height);
typedef CGSizeFromRadius = CGSize Function(Double radius);
typedef SizeFromRadius = CGSize Function(double radius);
typedef CGSizeAspectRatio = Double Function(CGSize size);
typedef SizeAspectRatio = double Function(CGSize size);
typedef CGSizeEndpoint = CGOffset Function(CGSize size, CGOffset origin);
typedef SizeEndpoint = CGOffset Function(CGSize size, CGOffset origin);
typedef CGSizeContains = Bool Function(CGSize size, CGOffset offset);
typedef SizeContains = bool Function(CGSize size, CGOffset offset);
typedef CGSizeFlipped = CGSize Function(CGSize size);
typedef SizeFlipped = CGSize Function(CGSize size);

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

  static CGSize copy(CGSize size) {
    return graphical.lookupFunction<CGSizeCopy, SizeCopy>('Size_copy')(size);
  }

  static CGSize square(double dimension) {
    return graphical.lookupFunction<CGSizeSquare, SizeSquare>('Size_square')(dimension);
  }

  static CGSize fromWidth(double width) {
    return graphical.lookupFunction<CGSizeFromWidth, SizeFromWidth>('Size_fromWidth')(width);
  }

  static CGSize fromHeight(double height) {
    return graphical.lookupFunction<CGSizeFromHeight, SizeFromHeight>('Size_fromHeight')(height);
  }

  static CGSize fromRadius(double radius) {
    return graphical.lookupFunction<CGSizeFromRadius, SizeFromRadius>('Size_fromRadius')(radius);
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
  @Double()
  external double shortestSide;
  @Double()
  external double longestSide;

  double get aspectRatio {
    return graphical.lookupFunction<CGSizeAspectRatio, SizeAspectRatio>('Size_aspectRatio')(this);
  }

  CGOffset topLeft(CGOffset origin) {
    return graphical.lookupFunction<CGSizeEndpoint, SizeEndpoint>('Size_topLeft')(this, origin);
  }

  CGOffset topCenter(CGOffset origin) {
    return graphical.lookupFunction<CGSizeEndpoint, SizeEndpoint>('Size_topCenter')(this, origin);
  }

  CGOffset topRight(CGOffset origin) {
    return graphical.lookupFunction<CGSizeEndpoint, SizeEndpoint>('Size_topRight')(this, origin);
  }

  CGOffset centerLeft(CGOffset origin) {
    return graphical.lookupFunction<CGSizeEndpoint, SizeEndpoint>('Size_centerLeft')(this, origin);
  }

  CGOffset center(CGOffset origin) {
    return graphical.lookupFunction<CGSizeEndpoint, SizeEndpoint>('Size_center')(this, origin);
  }

  CGOffset centerRight(CGOffset origin) {
    return graphical.lookupFunction<CGSizeEndpoint, SizeEndpoint>('Size_centerRight')(this, origin);
  }

  CGOffset bottomLeft(CGOffset origin) {
    return graphical.lookupFunction<CGSizeEndpoint, SizeEndpoint>('Size_bottomLeft')(this, origin);
  }

  CGOffset bottomCenter(CGOffset origin) {
    return graphical.lookupFunction<CGSizeEndpoint, SizeEndpoint>('Size_bottomCenter')(this, origin);
  }

  CGOffset bottomRight(CGOffset origin) {
    return graphical.lookupFunction<CGSizeEndpoint, SizeEndpoint>('Size_bottomRight')(this, origin);
  }

  bool contains(CGOffset offset) {
    return graphical.lookupFunction<CGSizeContains, SizeContains>('Size_contains')(this, offset);
  }

  CGSize get flipped {
    return graphical.lookupFunction<CGSizeFlipped, SizeFlipped>('Size_flipped')(this);
  }

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
