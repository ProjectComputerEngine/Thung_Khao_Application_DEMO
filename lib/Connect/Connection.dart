import 'dart:io';

import 'package:async/async.dart';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:thung_khao_rbac/Connect/Module/Product.dart';
class Connection {
  static final String ipserver = '128.199.110.176:8080';
  // final String ipserver;
// ------------------------------  TEST CONNECTION ------------------------------
  Future<dynamic> connection() async {
    String url = 'http://'+ipserver+'/connection.php';
    var response = await get(url);
    if (response.statusCode == 200){
      if(response.body.isEmpty){
        return 'ok';
      }
      else{
        return null;
        // showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');

      }
    }
    else {
      return null;
      // showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');

    }
  }
// ------------------------------  LOGIN 2 DATABASE ------------------------------
  Future<String> connectionLogin({String username, String password, String device, String time, String ip}) async {
    String url = 'http://$ipserver/login/Login2Database.php?username=$username&password=$password&device=$device&time=$time&ip=$ip';
    var response = await get(url).timeout(Duration(seconds: 3), onTimeout: (){
      // showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');
      return null;
    });
    if (response.statusCode == 200){
      if(response.body.isNotEmpty){
        return response.body;
      }
      else {
        return null;
        // showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');

      }
    }
    else {
      return null;
      // showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');

    }
  }
// ------------------------------  READ INBOX ------------------------------
  Future<String> connectionInbox({BuildContext context}) async {
    String url = "http://$ipserver/inbox/messageinbox.php";
    var response = await get(url);
    if (response.statusCode == 200) {
      if(response.body.isNotEmpty){
        return response.body;
      }
      else {
        return null;
        // showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');
      }
    } else {
      return null;
      // showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');
    }
  }
// ------------------------------  READ PRODUCT ALL ------------------------------
  Future<String> connectionProductAll() async {
    String url = "http://$ipserver/product/productall.php";
    var response = await get(url);
    if (response.statusCode == 200) {
      if(response.body.isNotEmpty){
        return response.body;
      }
      else {
        return null;
        // showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');
      }
    } else {
      return null;
      // showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');
    }
  }
// ------------------------------  SEND ORDER  ------------------------------
  Future<bool> connectionSendOrder({BuildContext context,String bill,String IDShop,String date,String total}) async{
    bool comlete = true;
    var request = await MultipartRequest('POST', Uri.parse('http://$ipserver/shopping/index.php'));
    print(IDShop.trim()+'|');
    request.fields['bill'] =bill;
    request.fields['idShop']=IDShop.trim();
    request.fields['date'] = date;
    request.fields['total'] = total;
    request.send().then((response) async {
      response.stream.transform(utf8.decoder).listen((event) {
        print(event);
      });
    }).catchError((onError) {
      print(onError.toString());
      comlete = false;
    }).then((value){
      print('Complete');
    });
    return comlete;
  }
// ------------------------------   READ ORDER ALL ------------------------------
  Future<String> connectionOrderAll({String status}) async {
    String url = "http://$ipserver/shopping/orderAll.php?status=$status";
    var response = await get(url);
    if (response.statusCode == 200) {
      if(response.body.isNotEmpty){
        return response.body;
      }
      else {
        return null;
        // showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');
      }
    } else {
      return null;
      // showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');
    }
  }
// ------------------------------  UPDATE ADMIN PERSONAL ------------------------------
  Future<String> connectionUpdateAdminData(String name,String tel,String address,String filePath,String id) async {
    var request = MultipartRequest('POST', Uri.parse('http://$ipserver/login/UpdateAdmin.php'));

    request.fields['Name'] = name;
    request.fields['Tel'] = tel;
    request.fields['Address'] = address;
    request.fields['ID'] = id;

    if(filePath[0] == '/'){
      File file = File(filePath);
      var stream = ByteStream(DelegatingStream.typed(file.openRead()));
      var length = await file.length();
      request.files.add(MultipartFile('image_file', stream, length,
          filename: basename(file.path)));
    }
    else{
      request.fields['Image_URL'] = filePath;
    }
    var response = await request.send();
   if(response.statusCode == 200){
     String image = await response.stream.bytesToString();
     if(image != 'Error'){
       return image;
     }else{
       return 'Error';
     }
   }
   else{
     return 'Error';
   }
  }
  // ------------------------------  UPDATE SHOP PERSONAL ------------------------------
  Future<String> connectionUpdateShopData(String nameShop, String nameOwner, String tel,
      String email,String GPS,String address,String filePath,String id) async {
    var request = MultipartRequest('POST', Uri.parse('http://$ipserver/login/UpdateShop.php'));

    request.fields['Name_Shop'] = nameShop;
    request.fields['Name_Owner'] = nameOwner;
    request.fields['Tel'] = tel;
    request.fields['Email'] = email;
    request.fields['GPS'] = GPS;
    request.fields['Address'] = address;
    request.fields['ID'] = id;


    if(filePath[0] == '/'){
      File file = File(filePath);
      var stream = ByteStream(DelegatingStream.typed(file.openRead()));
      var length = await file.length();
      request.files.add(MultipartFile('image_file', stream, length, filename: basename(file.path)));
    }
    else{
      request.fields['Image_URL'] = filePath;
    }
    var response = await request.send();
    if(response.statusCode == 200){
      String image = await response.stream.bytesToString();
      if(image != 'Error'){
        return image;
      }else{
        return 'Error';
      }
    }
    else{
      return 'Error';
    }
  }
  // ------------------------------  UPLOAD PRODUCT ------------------------------
  Future<String> connectionUploadProduct(
      {String name,
        String price,
        String weight,
        String size,
        String dateStart,
        String storage,
        String recommend,
        String note,
        String num,
        String filePath,
        BuildContext context}) async {
    var request = MultipartRequest('POST', Uri.parse('http://$ipserver/upload/'));
    request.fields['Name'] = name;
    request.fields['Num'] = num;
    request.fields['Price'] = price;
    request.fields['DateStart'] = dateStart;
    request.fields['Storage'] = storage;
    request.fields['Recommend'] = recommend;
    request.fields['Weight'] = weight;
    request.fields['Size'] = size;
    request.fields['Note'] = note;
    File file = File(filePath);
    var stream = ByteStream(DelegatingStream.typed(file.openRead()));
    var length = await file.length();
    request.files.add(MultipartFile('image_file', stream, length, filename: basename(file.path)));
    var response = await request.send();
    if(response.statusCode == 200){
      String complete = await response.stream.bytesToString();
      if(complete != 'Error'){
        return complete;
      }else{
        return 'Error';
      }
    }
    else{
      return 'Error';
    }
  }
  // ------------------------------  UPDATE PRODUCT ------------------------------
  Future<String> connectionUpdateProduct(
      {String id,
        String name,
        String price,
        String weight,
        String size,
        String dateStart,
        String storage,
        String recommend,
        String note,
        String num,
        String filePath,
        BuildContext context}) async {
    var request = MultipartRequest('POST', Uri.parse('http://192.168.1.36:8080/product/updateProductData.php'));

    request.fields['id'] = id;
    request.fields['Name'] = name;
    request.fields['Num'] = num;
    request.fields['Price'] = price;
    request.fields['DateStart'] = dateStart;
    request.fields['Storage'] = storage;
    request.fields['Recommend'] = recommend;
    request.fields['Weight'] = weight;
    request.fields['Size'] = size;
    request.fields['Note'] = note;

    if(filePath[0] == '/'){
      File file = File(filePath);
      var stream = ByteStream(DelegatingStream.typed(file.openRead()));
      var length = await file.length();
      request.files.add(MultipartFile('image_file', stream, length, filename: basename(file.path)));
    }
    else{
      request.fields['Image_URL'] = filePath;
    }
    var response = await request.send();
    if(response.statusCode == 200){
      String complete = await response.stream.bytesToString();
      if(complete != 'Error'){
        return complete;
      }else{
        return 'Error';
      }
    }
    else{
      return 'Error';
    }
  }
  // ------------------------------  DELETE PRODUCT ------------------------------
  Future<String> connectionDeleteProduct(String id) async {
    String url = "http://$ipserver/product/deleteProduct.php?id=$id";
    var response = await get(url);
    if (response.statusCode == 200) {
      if(response.body.isEmpty){
        return response.body;
      }
      else {
        return null;
        // showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');
      }
    } else {
      return null;
      // showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');
    }
  }

}


