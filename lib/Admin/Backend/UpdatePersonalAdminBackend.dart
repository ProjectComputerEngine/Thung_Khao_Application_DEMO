import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:thung_khao_rbac/Connect/Connection.dart';
Future<void> ReadFildPath(StreamController streamController) async {
  FilePickerResult result =
  await FilePicker.platform.pickFiles(type: FileType.image,allowMultiple: false);
  if (result != null) {
    File file = File(result.files.single.path);
    print(file.path);
    streamController.add(file);
  } else {}
}
