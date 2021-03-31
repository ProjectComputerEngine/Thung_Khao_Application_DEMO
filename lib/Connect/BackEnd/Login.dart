import 'dart:convert';

import 'package:thung_khao_rbac/Connect/Connection.dart';
import '../Module/Admin.dart';
import '../Module/ShopAdmin.dart';

import 'package:thung_khao_rbac/Connect/Crash.dart';

class LoginConnection extends Connection {
  DatabaseUser _databaseUser = DatabaseUser('UserOnline.DB');
  Admin admin;
  Shop shop;

  Future<String> login(
    String username,
    String password,
    String date,
  ) async {
    try {
      var request = await connectionLogin(
          username: username,
          password: password,
          device: 'FlutterAndroid',
          time: date,
          ip: '127.0.0.1');

      if (request.isNotEmpty) {
        var jsonData = jsonDecode(request);
        if (jsonData['ID_Admin'][0] == 'A' || jsonData['ID_Admin'][0] == 'S') {
          if (jsonData['ID_Admin'][0] == 'A') {
            shop = null;
            admin = Admin(
                ID: jsonData['ID_Admin'],
                Name_Device: jsonData['Name_Device'],
                DateLogin: jsonData['DateLogin'],
                Name: jsonData['Name'],
                Tel: jsonData['Tel'],
                Position: jsonData['Position'],
                Image_URL: jsonData['Image_URL'],
                Address: jsonData['Address']);
            await _databaseUser.addAdmin(admin);
          } else {
            shop = null;
            shop = Shop(
                ID: jsonData['ID_Admin'],
                Name_Device: jsonData['Name_Device'],
                DateLogin: jsonData['DateLogin'],
                Name_Shop: jsonData['Name_Shop'],
                Name_Owner: jsonData['Name'],
                Tel: jsonData['Tel'],
                Address: jsonData['Address'],
                Image_URL: jsonData['Image_URL'],
                Email: jsonData['Email'],
                GPS: jsonData['GPS'],
                IP: jsonData['IP']);
            await _databaseUser.addShop(shop);
          }
          return 'true';
        } else {
          return 'false';
        }
        return 'true';
      } else {
        return 'error';
      }
    } catch (error) {
      return 'error';
    }
  }

  Future<dynamic> showAdminData() async {
    try {
      Admin admin = await _databaseUser.loadAllDataAdmin();
      if (admin != null) {
        return admin;
      } else {
        return 'error';
      }
    } catch (error) {
      return 'error';
    }
  }

  Future<Shop> showShopData() async {
    try {
      Shop shop = await _databaseUser.loadAllDataShop();
      if (shop != null) {
        return shop;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  Future<Admin> updateAdminData(String name, String tel, String address,
      String filePath, String id) async {
    String complete =
        await connectionUpdateAdminData(name, tel, address, filePath, id);
    if (complete != 'Error') {
      _databaseUser.clearData();
      admin = Admin(
        Name: name,
        Address: admin.Address,
        Image_URL: complete,
        Position: admin.Position,
        DateLogin: admin.DateLogin,
        ID: admin.ID,
        Tel: admin.Tel,
        Name_Device: admin.Name_Device,
      );
      print('Yes');
    } else {
      print('No');
    }
  }

  logout() {
     _databaseUser.clearData();
  }
}
