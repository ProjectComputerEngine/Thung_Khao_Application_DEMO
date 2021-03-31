import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thung_khao_rbac/Admin/PersonalAdmin.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Login.dart';
import 'package:thung_khao_rbac/ShopAdmin/ShopMain.dart';
import '../Widget/LoginWidget.dart';

login(BuildContext context,String username , String password) async{
  if (username.isNotEmpty && password.isNotEmpty) {
    String time = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()) +
        "." +
        DateTime.now().millisecond.toString();

    var status = await Provider.of<LoginConnection>(context,listen: false).login(username, password,time);
    if(status== 'true'){
      if(Provider.of<LoginConnection>(context,listen: false).shop != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ShopMain()));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PersonalAdminMain()));
      }
    }
    else if (status == 'false'){
      showMyDialog(context, 'บัญชีผู้ใช้งานหรือรหัสผ่าน \n กรุณาลองใหม่อีกครั้ง');
    }
    else{
      showMyDialog(context, 'การเชื่อมต่อมีปัญหา \n กรุณาลองใหม่อีกครั้ง ');
    }
  } else {
    showMyDialog(context,'กรุณาใส่บัญชีผู้ใช้ หรือ รหัสผ่าน \nให้ครบถ้วน');
  }
}