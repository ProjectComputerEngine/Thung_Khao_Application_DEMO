import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:thung_khao_rbac/Admin/Widget/AddProductWidget.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Product.dart';
import 'package:thung_khao_rbac/Connect/Module/Product.dart';

Future<void> ReadFildPath(StreamController streamController) async {
  FilePickerResult result = await FilePicker.platform
      .pickFiles(type: FileType.image, allowMultiple: false);
  if (result != null) {
    File file = File(result.files.single.path);
    print(file.path);
    streamController.add(file);
  } else {}
}

Future<void> UploadProduct(
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
  Product newProduct = Product(
      Name: name,
      Recommend: recommend,
      Note: note,
      Num: num,
      DateStart: dateStart,
      Price: price,
      Size: width +'X'+ height,
      Storage: storage,
      UrlImage1: filePath,
      Weight: weight);
  if (newProduct.Name.isNotEmpty &&
      newProduct.Price.isNotEmpty &&
      newProduct.Size.isNotEmpty &&
      num.isNotEmpty &&
      newProduct.DateStart.isNotEmpty &&
      newProduct.Storage.isNotEmpty &&
      newProduct.Recommend.isNotEmpty &&
      newProduct.Note.isNotEmpty &&
      newProduct.UrlImage1.isNotEmpty
  ){
    var complete = await Provider.of<ProductConnection>(context, listen: false)
        .addProduct(newProduct);
    if (complete) {
      showMyDialogY(context, 'เพิ่มสินค้าสำเร็จ');
    } else {
      showMyDialog(
          context, 'เกิดข้อผิดพลาดทางเคครือข่ย \n กรุณาลองใหม่อีกครั้ง');
    }
  }
  else{
     showMyDialog(context, 'กรุณากรอกข้อมูลสินค้าให้ครบถ้วน');
  }
}
