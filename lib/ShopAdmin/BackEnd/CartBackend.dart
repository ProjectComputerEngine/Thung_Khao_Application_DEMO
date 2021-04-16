import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Login.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Order.dart';
import '../Widget/CartWidget.dart';

Future<void> clearCart(BuildContext context) async {
  bool complete = await Provider.of<OrderConnection>(context, listen: false)
      .billClear(Provider.of<LoginConnection>(context, listen: false).shop.ID);
  if (complete) {
    showMyDialogY(context, 'ลบสินค้าในตะกร้าสำเร็จ \nกรุณาเลือกสินค้าใหม่');
  } else {
    showMyDialog(context, 'เกิดข้อผลพราดกรุณาลองใหม่อีกครั้ง');
  }
}

Future<void> sendOrder(BuildContext context, String Sum) async {
  bool complete = await Provider.of<OrderConnection>(context, listen: false)
      .addOrder(Provider.of<OrderConnection>(context,listen: false).billList, Sum,
          Provider.of<LoginConnection>(context,listen: false).shop.ID);
  if (complete) {
    bool completeD = await Provider.of<OrderConnection>(context, listen: false)
        .billClear(Provider.of<LoginConnection>(context, listen: false).shop.ID);
    if (completeD) {
      showMyDialogY(
          context, 'ส่งคำสั่งซื้อสำเร็จ \nสามารถเชกสถานนะทางคำสั่งซื้อได้');
      } else {
      showMyDialog(context, 'เกิดข้อผลพราดกรุณาลองใหม่อีกครั้ง');
    }
  } else {
    showMyDialog(context, 'เกิดข้อผลพราดกรุณาลองใหม่อีกครั้ง');
  }
}
