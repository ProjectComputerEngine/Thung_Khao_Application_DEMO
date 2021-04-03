import 'dart:convert';
import 'package:thung_khao_rbac/Connect/BackEnd/Bill.dart';
import 'package:thung_khao_rbac/Connect/Crash.dart';

import '../Module/Order.dart';
import 'package:thung_khao_rbac/Connect/Connection.dart';

class OrderConnection extends Connection{
  DatabaseOrder _databaseOrder = DatabaseOrder('Bill.DB');
  List<Order> orderList = [];
  List<Bill> billList = [];
  addOrder(){

  }
  updateOrder(){

  }
  Future<bool> selectAllOrder(String status) async{
    try{
      String response = await connectionOrderAll(status: status);
      if (response.isNotEmpty) {
        orderList.clear();
        List<dynamic> jsonData = jsonDecode(response);
        for(int i=0;i<jsonData.length;i++){
          orderList.add(Order(
            ID: jsonData[i]['ID'],
            Name: jsonData[i]['Name'],
            Status: jsonData[i]['Status'],
            Image_URL: jsonData[i]['Image_URL'],
            Date:jsonData[i]['Date'],
          ));
          return true;
        }
      } else {
        return false;
      }
    }
    catch (error){
      return false;
    }
  }Future<bool> selectAllBill() async{
    try{
         var listOrder  = await _databaseOrder.loadAllData();
         if(listOrder.length>0){
           billList.clear();
           billList = listOrder;
          return true;

      } else {
        return false;
      }
    }
    catch (error){
      return false;
    }
  }
  Future<bool> addOrderinBill(Bill bill) async{
    try{
      // billList.add(bill);
      await _databaseOrder.addOrder(bill);
      return true;
    }
    catch(error){
      return false;
    }
  }
  Future<void> billClear() async {
    await _databaseOrder.clearData();
  }

  selectShopOrder(String status,String id) async {

  }

}