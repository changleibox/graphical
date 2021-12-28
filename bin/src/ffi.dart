import 'dart:ffi';
import 'dart:io' show Platform;

import 'package:path/path.dart';

/// Created by changlei on 2021/12/27.
String _platformPath(String name, String path) {
  if (Platform.isLinux || Platform.isAndroid || Platform.isFuchsia) {
    return join(path, 'lib' + name + '.so');
  }
  if (Platform.isMacOS) {
    return join(path, 'lib' + name + '.dylib');
  }
  if (Platform.isWindows) {
    return join(path, name + '.dll');
  }
  throw Exception('Platform not implemented');
}

DynamicLibrary dlopenPlatformSpecific(String name, {String path = ''}) {
  final fullPath = _platformPath(name, path);
  return DynamicLibrary.open(fullPath);
}

final graphical = dlopenPlatformSpecific(
  'graphical',
  path: '/Users/changlei/CLionProjects/graphical/lib/',
);
