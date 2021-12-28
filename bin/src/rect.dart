import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'ffi.dart';
import 'offset.dart';
import 'size.dart';

typedef CGRectInit = CGRect Function(Double left, Double top, Double right, Double bottom);
typedef RectInit = CGRect Function(double left, double top, double right, double bottom);
typedef CGRectFromLTWH = CGRect Function(Double left, Double top, Double width, Double height);
typedef RectFromLTWH = CGRect Function(double left, double top, double width, double height);
typedef CGRectFromCircle = CGRect Function(CGOffset center, Double radius);
typedef RectFromCircle = CGRect Function(CGOffset center, double radius);
typedef CGRectFromCenter = CGRect Function(CGOffset center, Double width, Double height);
typedef RectFromCenter = CGRect Function(CGOffset center, double width, double height);
typedef CGRectFromPoints = CGRect Function(CGOffset a, CGOffset b);
typedef RectFromPoints = CGRect Function(CGOffset a, CGOffset b);
typedef CGRectShift = CGRect Function(CGRect rect, CGOffset offset);
typedef RectShift = CGRect Function(CGRect rect, CGOffset offset);
typedef CGRectTranslate = CGRect Function(CGRect rect, Double translateX, Double translateY);
typedef RectTranslate = CGRect Function(CGRect rect, double translateX, double translateY);
typedef CGRectInflate = CGRect Function(CGRect rect, Double delta);
typedef RectInflate = CGRect Function(CGRect rect, double delta);
typedef CGRectDeflate = CGRect Function(CGRect rect, Double delta);
typedef RectDeflate = CGRect Function(CGRect rect, double delta);
typedef CGRectIntersect = CGRect Function(CGRect rect, CGRect other);
typedef RectIntersect = CGRect Function(CGRect rect, CGRect other);
typedef CGRectExpandToInclude = CGRect Function(CGRect rect, CGRect other);
typedef RectExpandToInclude = CGRect Function(CGRect rect, CGRect other);
typedef CGRectOverlaps = Bool Function(CGRect rect, CGRect other);
typedef RectOverlaps = bool Function(CGRect rect, CGRect other);
typedef CGRectContains = Bool Function(CGRect rect, CGOffset offset);
typedef RectContains = bool Function(CGRect rect, CGOffset offset);

/// Created by changlei on 2021/12/28.
///
/// Rect
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

  static CGRect init(double left, double top, double right, double bottom) {
    return graphical.lookupFunction<CGRectInit, RectInit>('Rect_init')(left, top, right, bottom);
  }

  static CGRect fromLTWH(double left, double top, double width, double height) {
    return graphical.lookupFunction<CGRectFromLTWH, RectFromLTWH>('Rect_fromLTWH')(left, top, width, height);
  }

  static CGRect fromCircle(CGOffset center, double radius) {
    return graphical.lookupFunction<CGRectFromCircle, RectFromCircle>('Rect_fromCircle')(center, radius);
  }

  static CGRect fromCenter(CGOffset center, double width, double height) {
    return graphical.lookupFunction<CGRectFromCenter, RectFromCenter>('Rect_fromCenter')(center, width, height);
  }

  static CGRect fromPoints(CGOffset a, CGOffset b) {
    return graphical.lookupFunction<CGRectFromPoints, RectFromPoints>('Rect_fromPoints')(a, b);
  }

  @Double()
  external double left;
  @Double()
  external double top;
  @Double()
  external double right;
  @Double()
  external double bottom;
  @Double()
  external double width;
  @Double()
  external double height;
  external CGSize size;
  @Double()
  external double shortestSide;
  @Double()
  external double longestSide;
  external CGOffset topLeft;
  external CGOffset topCenter;
  external CGOffset topRight;
  external CGOffset centerLeft;
  external CGOffset center;
  external CGOffset centerRight;
  external CGOffset bottomLeft;
  external CGOffset bottomCenter;
  external CGOffset bottomRight;

  CGRect shift(CGOffset offset) {
    return graphical.lookupFunction<CGRectShift, RectShift>('Rect_shift')(this, offset);
  }

  CGRect translate(double translateX, double translateY) {
    return graphical.lookupFunction<CGRectTranslate, RectTranslate>('Rect_translate')(this, translateX, translateY);
  }

  CGRect inflate(double delta) {
    return graphical.lookupFunction<CGRectInflate, RectInflate>('Rect_inflate')(this, delta);
  }

  CGRect deflate(double delta) {
    return graphical.lookupFunction<CGRectDeflate, RectDeflate>('Rect_deflate')(this, delta);
  }

  CGRect intersect(CGRect other) {
    return graphical.lookupFunction<CGRectIntersect, RectIntersect>('Rect_intersect')(this, other);
  }

  CGRect expandToInclude(CGRect other) {
    return graphical.lookupFunction<CGRectExpandToInclude, RectExpandToInclude>('Rect_expandToInclude')(this, other);
  }

  bool overlaps(CGRect other) {
    return graphical.lookupFunction<CGRectOverlaps, RectOverlaps>('Rect_overlaps')(this, other);
  }

  bool contains(CGOffset offset) {
    return graphical.lookupFunction<CGRectContains, RectContains>('Rect_contains')(this, offset);
  }

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
    return 'CGRect{left: $left, top: $top, right: $right, bottom: $bottom}';
  }
}
