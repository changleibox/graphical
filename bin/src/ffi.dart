import 'dart:ffi';

/// Created by changlei on 2021/12/27.

DynamicLibrary dlopenPlatformSpecific(String path) {
  return DynamicLibrary.open(path);
}