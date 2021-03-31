import 'dart:convert';
import '../Module/Order.dart';
import 'package:thung_khao_rbac/Connect/Connection.dart';
class OrderConnection extends Connection{
  List<Order> orderList = [];
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
  }
  selectShopOrder(String status,String id) async {

  }

}