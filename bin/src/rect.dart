import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'size.dart';

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
