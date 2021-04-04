import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Bill.dart';
import 'package:provider/provider.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Login.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Order.dart';
import 'package:thung_khao_rbac/ShopAdmin/Widget/StoratgeDetailWidget.dart';

Future<void> addOrder(BuildContext context,String id, String name, String num, String price,String imageURL) async {
  Bill bill = Bill(name: name, id: id, num: num, price: price,imageURL: imageURL,ID_Shop: Provider.of<LoginConnection>(context,listen: false).shop.ID);
  if(bill != null){
     bool complete = await Provider.of<OrderConnection>(context,listen: false).addOrderinBill(bill);
     if(complete){
       showMyDialogYN(context, 'ยืนยันการเพิ่มสินค้าลงตะกร้า');
     }
     else{
       showMyDialog(context, 'กรุณาลองใหม่อีกครั้ง');
     }
  }

}
