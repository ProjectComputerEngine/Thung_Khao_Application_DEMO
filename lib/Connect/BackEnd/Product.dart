import 'dart:convert';

import 'package:thung_khao_rbac/Connect/Connection.dart';
import 'package:thung_khao_rbac/Connect/Module/Product.dart';

class ProductConnection extends Connection {
  List<Product> product = [];

  addProduct(Product newProduct) {

  }

  updateProduct() {

  }

  Future<bool> showAllProduct() async {
    try {
      var request = await connectionProductAll();
      if (request != null) {
        var jsonData = jsonDecode(request);
        if (jsonData != null) {
          product.clear();
          for (int i = 0; i < jsonData.length; i++) {
            product.add(Product(
              ID: jsonData[i]['ID'],
              Name: jsonData[i]['Name'],
              Promotion: jsonData[i]['Pomotion'],
              UrlImage3: jsonData[i]['UrlImage3'],
              UrlImage2: jsonData[i]['UrlImage2'],
              UrlImage1: jsonData[i]['UrlImage1'],
              Storage: jsonData[i]['Storage'],
              Star: jsonData[i]['Star'],
              Size: jsonData[i]['Size'],
              Price: jsonData[i]['Price'],
              DateStart: jsonData[i]['DateStart'],
              Num: jsonData[i]['Num'],
              Note: jsonData[i]['Trl'],
              Recommend: jsonData[i]['Detail'],
              Weight: jsonData[i]['Wight'],
            ));
          }
          return true;
        } else {
          return false;
        }
        // return request;
        // return 'Error';
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}
