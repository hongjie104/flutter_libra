import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

/// 复制到剪粘板
Future<void> copyToClipboard(final String text) {
  return Clipboard.setData(ClipboardData(text: text));
}

String fixedNumber(final int val) {
  return val < 10 ? '0$val' : val.toString();
}

/// 截屏图片生成图片流ByteData
Future<ByteData?> capturePngToByteData(GlobalKey key) async {
  final RenderRepaintBoundary boundary =
      key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
  final double dpr = ui.window.devicePixelRatio; // 获取当前设备的像素比
  final ui.Image image = await boundary.toImage(pixelRatio: dpr);
  return await image.toByteData(format: ui.ImageByteFormat.png);
}

/// 将图片转成base64
String? img2base64(File imgFile) {
  final List<int> imageBytes = imgFile.readAsBytesSync();
  return base64.encode(imageBytes);
  // return base64Encode(imageBytes);
}
