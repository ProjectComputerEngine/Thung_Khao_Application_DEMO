import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Login.dart';
import 'package:provider/provider.dart';
import 'package:thung_khao_rbac/Connect/Module/ShopAdmin.dart';
import 'package:thung_khao_rbac/ShopAdmin/Widget/UpdatePersonalShopWidget.dart';

Future<void> ReadFildPath(StreamController streamController) async {
  FilePickerResult result = await FilePicker.platform
      .pickFiles(type: FileType.image, allowMultiple: false);
  if (result != null) {
    File file = File(result.files.single.path);
    print(file.path);
    streamController.add(file);
  } else {}
}

Future<void> UpdatePersonalShopData(
    BuildContext context,
    String shopName,
    String shopOwner,
    String tel,
    String GPS,
    String email,
    String address,
    String pathImage,
    String id,
    Shop shop) async {
  if (shop.Name_Shop == shopName &&
      shop.Name_Owner == shopOwner &&
      shop.Tel == tel &&
      shop.GPS == GPS &&
      shop.Email == email &&
      shop.Image_URL == pathImage) {
    showMyDialog(context, 'กรุณาใส่ข้อมูลใหม่');
  } else {
    bool complete = await Provider.of<LoginConnection>(context, listen: false)
        .updateShopDataPathImage(shopName,shopOwner,tel,email,GPS,address,pathImage,id);
    if (complete) {
      showMyDialogY(context, 'อัพเดทข้อมูลส่วนตัวสำเร็จ');
      print('complete');
    } else {
      showMyDialogY(
          context, 'เกิดข้อผิดพลาดทางเครือข่าย \n กรุณาลองใหม่อีกครั้ง');
      print('Error');
    }
  }
}
