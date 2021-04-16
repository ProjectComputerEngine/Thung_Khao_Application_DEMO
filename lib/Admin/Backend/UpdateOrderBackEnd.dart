import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Order.dart';
import '../Widget/OrderDetailWidget.dart';
updateStatus(BuildContext context,int status,String id) async {
  switch (status){
    case 1:
      {

         print('1');
      }
      break;
    case 2:
      {
        print('2');
      }
      break;
    case 3:
      {
        print('3');
      }
      break;
    case 4:
      {
        print('4');
      }
      break;
    case 5:
      {
        print('5');
      }
      break;
    default :
      {
        print('4');
      }
      break;

  }
  bool complete = await Provider.of<OrderConnection>(context,listen: false).updateOrder(status,id);
  if(complete){
    showMyDialog(context, 'อัพเดทสถานะเรียบร้อย');
  }
  else{
    showMyDialog(context, 'เกิดปัญหาด้านเครือข่าย \nกรุณาลองใหม่อีกครั้ง');
  }
}