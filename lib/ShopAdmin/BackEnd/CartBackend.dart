import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Login.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Order.dart';
import '../Widget/CartWidget.dart';
Future<void> clearCart(BuildContext context) async {
  bool complete = await Provider.of<OrderConnection>(context,listen: false).billClear(Provider.of<LoginConnection>(context,listen: false).shop.ID);
  if(complete){

  }
  else{
    showMyDialog(context, 'เกิดข้อผลพราดกรุณาลองใหม่อีกครั้ง');
  }
}