import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:thung_khao_rbac/Admin/Widget/StorageDetailWidget.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Product.dart';
import 'package:thung_khao_rbac/Connect/Module/Product.dart';
import 'package:file_picker/file_picker.dart';

Future<void> ReadFildPath(StreamController streamController) async {
  FilePickerResult result = await FilePicker.platform
      .pickFiles(type: FileType.image, allowMultiple: false);
  if (result != null) {
    File file = File(result.files.single.path);
    print(file.path);
    streamController.add(file);
  } else {}
}


Future<void> DelectProduct(BuildContext context, String id) async {
  bool complete = await Provider.of<ProductConnection>(context, listen: false)
      .deleteProduct(id);
  if (complete) {
    showMyDialogY(context, 'ลบสินค้าสำเร็จ');
  } else {
    showMyDialog(context, 'เกิดข้อผิดพลาดทางเครือข่าย \n กรุณาลองใหม่อีกครั้ง');
  }
}

Future<void> UpdateProduct(
    String id,
    String name,
    String price,
    String weight,
    String width,
    String height,
    String num,
    String dateStart,
    String storage,
    String recommend,
    String note,
    String filePath,
    BuildContext context) async {
  Product product = Product(
    UrlImage1: filePath,
    Storage: storage,
    Size: width + 'X' + height,
    Price: price,
    DateStart: dateStart,
    Num: num,
    Note: note,
    Recommend: recommend,
    Name: name,
    ID: id,
    Weight: weight,
  );
  bool complete =
      await Provider.of<ProductConnection>(context,listen: false).updateProduct(product);
  if(complete){
    showMyDialogY(context, 'อัพเดทข้อมูลสินค้าสำร็จ');
  }
  else{
    showMyDialog(context, 'เกิดข้อผิดพลาดทางเครือข่าย \nกรุณาลองใหม่อีกครั้ง');
  }
}
