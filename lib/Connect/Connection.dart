import 'dart:io';

import 'package:async/async.dart';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
class Connection {
  static final String ipserver = '128.199.110.176:8080';
  // final String ipserver;

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

  Future<String> connectionUpdateAdminData(String name,String tel,String address,String filePath,String id) async {
    var request = MultipartRequest('POST', Uri.parse('http://128.199.110.176:8080/login/UpdateAdmin.php'));
    File file = File(filePath);
    request.fields['Name'] = name;
    request.fields['Tel'] = tel;
    request.fields['Address'] = address;
    request.fields['ID'] = id;
    var stream = ByteStream(DelegatingStream.typed(file.openRead()));
    var length = await file.length();
    request.files.add(MultipartFile('image_file',stream,length,filename: basename(file.path)));
   var response = await request.send();
   if(response.statusCode == 200){
     print(response.reasonPhrase);
     if(response.reasonPhrase != 'Error'){
       return response.reasonPhrase;
     }else{
       return 'Error';
     }
   }
   else{
     return 'Error';
   }
  }
}

