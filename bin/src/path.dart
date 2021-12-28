import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'ffi.dart';
import 'incircle.dart';

typedef CGPathInit = CGPath Function(CGIncircle top, CGIncircle left, CGIncircle right);
typedef PathInit = CGPath Function(CGIncircle top, CGIncircle left, CGIncircle right);
typedef CGPathToJson = Pointer<Int8> Function(CGPath path);
typedef PathToJson = Pointer<Int8> Function(CGPath path);

/// Created by changlei on 2021/12/28.
///
/// Path
class CGPath extends Struct {
  factory CGPath(CGIncircle top, CGIncircle left, CGIncircle right) {
    return calloc<CGPath>().ref
      ..top = top
      ..left = left
      ..right = right;
  }

  factory CGPath.fromPointer(Pointer<CGPath> pointer) {
    return pointer.ref;
  }

  static CGPath init(CGIncircle top, CGIncircle left, CGIncircle right) {
    return graphical.lookupFunction<CGPathInit, PathInit>('Path_init')(top, left, right);
  }

  external CGIncircle top;
  external CGIncircle left;
  external CGIncircle right;

  String toJson() {
    return graphical.lookupFunction<CGPathToJson, PathToJson>('Path_toJson')(this).string;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CGPath &&
          runtimeType == other.runtimeType &&
          top == other.top &&
          left == other.left &&
          right == other.right;

  @override
  int get hashCode => top.hashCode ^ left.hashCode ^ right.hashCode;

  @override
  String toString() {
    return 'CGPath{top: $top, left: $left, right: $right}';
  }
}
