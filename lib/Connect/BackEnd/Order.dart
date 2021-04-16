import 'dart:convert';
import 'package:thung_khao_rbac/Connect/BackEnd/Bill.dart';
import 'package:thung_khao_rbac/Connect/Crash.dart';
import 'package:thung_khao_rbac/Connect/Module/OrderDetail.dart';

import '../Module/Order.dart';
import 'package:thung_khao_rbac/Connect/Connection.dart';
import 'package:intl/intl.dart';

class OrderConnection extends Connection {
  DatabaseOrder _databaseOrder = DatabaseOrder('Bill.DB');
  List<Order> orderList = [];
  List<Bill> billList = [];
  List<DetailOrder> detailList = [];

  // =============================================================================================================
  // =================================  ORDER SYSTEM =============================================================
  // =============================================================================================================

  // =================================  SEND ORDER TO SERVER BY ADMIN SHOP ===========================================
  Future<bool> addOrder(List<Bill> bill, String total, String idShop) async {
    try {
      var jsonBill = jsonEncode(bill);
      String time = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()) +
          "." +
          DateTime.now().millisecond.toString();
      String complete = await connectionSendOrder(
          total: total, bill: jsonBill, date: time, IDShop: idShop);
      if (complete == 'OK') {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  // =================================  UPDATE STATUS ORDER By ADMIN SYSTEM ===========================================
  Future<bool> updateOrder(int status,String id) async{
    try{
      String complete = await connectionOrderUpdate(id: id,status: status.toString());
    if(complete==''){
      return true;
    }
    else{
      return false;
    }
    }
    catch(error){
      return false;
    }
  }

  // =================================  SELECT ALL ORDER By ADMIN SYSTEM ===========================================
  Future<bool> selectAllOrder(String status, String id) async {
    try {
      String response = await connectionOrderAll(status: status, id: id);
      if (response.isNotEmpty) {
        orderList.clear();
        List<dynamic> jsonData = jsonDecode(response);
        for (int i = 0; i < jsonData.length; i++) {
          orderList.add(Order(
            ID: jsonData[i]['ID'],
            Name: jsonData[i]['Name'],
            Status: jsonData[i]['Status'],
            Image_URL: jsonData[i]['Image_URL'],
            Date: jsonData[i]['Date'],
          ));
          return true;
        }
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  // =================================  SELECT ALL ORDER By ADMIN SHOP ===========================================

  Future<bool> showDetailOrder(String id) async {
    try {
      String response = await connectionOrderDetail(id: id);
      if (response.isNotEmpty) {
        detailList.clear();
        List<dynamic> jsonData = jsonDecode(response);
        for (int i = 0; i < jsonData.length; i++) {
          detailList.add(DetailOrder(
            Name: jsonData[i]['Name'],
            Num: jsonData[i]['Num'],
            Price: jsonData[i]['Price'],
            UrlImage: jsonData[i]['UrlImage1'],
          ));
        }
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  // =============================================================================================================
  // =================================  CART SYSTEM ==============================================================
  // =============================================================================================================

  // =================================  SELECT ALL ORDER IN CART ===========================================
  Future<bool> selectAllBill(String idShop) async {
    try {
      List<Bill> listOrder = await _databaseOrder.loadAllData(idShop);
      if (listOrder.length > 0) {
        billList.clear();
        billList = listOrder;
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  // =================================  ADD ORDER IN CART ===========================================
  Future<bool> addOrderinBill(Bill bill) async {
    try {
      // billList.add(bill);
      await _databaseOrder.addOrder(bill);
      return true;
    } catch (error) {
      return false;
    }
  }

  // =================================  CLEAR ALL ORDER IN CART By ADMIN SHOP =========================
  Future<bool> billClear(String idString) async {
    try {
      await _databaseOrder.clearData(idString);
      return true;
    } catch (error) {
      return false;
    }
  }
}
