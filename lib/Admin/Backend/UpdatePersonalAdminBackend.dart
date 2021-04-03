import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Login.dart';
import 'package:thung_khao_rbac/Connect/Connection.dart';
import 'package:provider/provider.dart';
import 'package:thung_khao_rbac/Connect/Module/Admin.dart';
import '../Widget/UpdatePersonalAdminWidget.dart';

Future<void> ReadFildPath(StreamController streamController) async {
  FilePickerResult result = await FilePicker.platform
      .pickFiles(type: FileType.image, allowMultiple: false);
  if (result != null) {
    File file = File(result.files.single.path);
    print(file.path);
    streamController.add(file);
  } else {}
}

Future<void> UpdatePersonalAdmin(BuildContext context, String name, String tel,
    String address, String pathImage, String id,Admin admin) async {
  if(admin.Image_URL==pathImage && admin.Name == name && admin.Tel == tel && admin.Address == address){
    showMyDialog(
        context, 'กรุณาใส่ข้อมูลใหม่');
  }else {
    bool complete = await Provider.of<LoginConnection>(context, listen: false)
        .updateAdminDataPathImage(name, tel, address, pathImage, id);
    if (complete) {
      showMyDialogY(context, 'อัพเดทข้อมูลส่วนตัวสำเร็จ');
      print('complete');
    }
    else {
      showMyDialog(
          context, 'เกิดข้อผิดพลาดทางเครือข่าย \n กรุณาลองใหม่อีกครั้ง');
      print('Error');
    }
  }

}

