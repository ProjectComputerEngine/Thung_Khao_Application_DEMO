import 'dart:io';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:thung_khao_rbac/Connect/Module/Message.dart';
import './Module/Product.dart';
import './Module/Order.dart';
import './Module/Admin.dart';
import './Module/ShopAdmin.dart';
import 'package:intl/intl.dart';

class DatabaseProduct {
  final String dbname = 'Product.DB';

  Future<Database> openDatabase() async {
    Directory app = await getApplicationDocumentsDirectory();
    String dbpath = app.path + dbname;
    print(dbpath);
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbpath);
    return db;
  }

  addProduct(Product product) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("Product");
    var date = DateFormat.yMd(product.DateStart).add_Hm().toString();
    var keyID = store.add(db, {
      'ID': product.ID,
      'Name': product.Name,
      'Num': product.Num,
      'Price': product.Price,
      'Promotion': product.Promotion,
      'Star': product.Star,
      'DateStart': date,
      'Storage': product.Storage,
      'Recommend': product.Recommend,
      'Weight': product.Weight,
      'Size': product.Size,
      'UrlImage1': product.UrlImage1,
      'UrlImage2': product.UrlImage2,
      'UrlImage3': product.UrlImage3,
      'Note': product.Note,
    });
    print('KeyID' + keyID.toString());
    db.close();
  }

  Future<dynamic> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("Product");
    var snapshot = await store.find(db);
    List product = List<Product>();
    for (var record in snapshot) {
      product.add(Product(
        Name: record['Name'],
        Recommend: record['Recommend'],
        Note: record['Note'],
        Num: record['Num'],
        DateStart: record['DateStart'],
        Price: record['Price'],
        Size: record['Size'],
        Star: record['Star'],
        Storage: record['Storage'],
        UrlImage1: record['UrlImage1'],
        UrlImage2: record['UrlImage2'],
        UrlImage3: record['UrlImage3'],
        ID: record['ID'],
        Promotion: record['Promotion'],
        Weight: record['Weight'],
      ));
    }
    return product;
  }

  Future clearData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("Product");
    store.drop(db);
  }
}

// -----------------------------------------------------------------------------
class DatabaseMessage {
  final String dbname;

  DatabaseMessage(this.dbname);

  Future<Database> openDatabase() async {
    Directory app = await getApplicationDocumentsDirectory();
    String dbpath = app.path + dbname;
    print(dbpath);
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbpath);
    return db;
  }

  addMessage(Message message) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("Message");
    var date = DateFormat.yMd(message.time).add_Hm().toString();
    var keyID = store.add(db, {
      'Message': message.message,
      'Name': message.name,
      'ImageURL': message.imageURL,
      'Time': date,
      'ID': message.ID,
    });
    print('KeyID' + keyID.toString());
    db.close();
  }

  Future<dynamic> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("Message");
    var snapshot = await store.find(db);
    List message = List<Message>();
    for (var record in snapshot) {
      message.add(Message(
        ID: record['ID'],
        name: record['Name'],
        time: record['Time'],
        message: record['Message'],
        imageURL: record['ImageURL'],
      ));
    }
    return message;
  }

  Future clearData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("Message");
    store.drop(db);
  }
}

// -----------------------------------------------------------------------------

class DatabaseOrder {
  final String dbname;

  DatabaseOrder(this.dbname);

  Future<Database> openDatabase() async {
    Directory app = await getApplicationDocumentsDirectory();
    String dbpath = app.path + dbname;
    print(dbpath);
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbpath);
    return db;
  }

  addOrder(Order order) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("Order");
    var date = DateFormat.yMd(order.Date).add_Hm().toString();
    var keyID = store.add(db, {
      'Status': order.Status,
      'Name': order.Name,
      'ImageURL': order.Image_URL,
      'Time': date,
      'ID': order.ID,
    });
    print('KeyID' + keyID.toString());
    db.close();
  }

  Future<dynamic> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("Order");
    var snapshot = await store.find(db);
    List order = List<Order>();
    for (var record in snapshot) {
      order.add(Order(
        ID: record['ID'],
        Name: record['Name'],
        Status: record['Status'],
        Image_URL: record['ImageURL'],
        Date: record['Time'],
      ));
    }
    return order;
  }

  Future clearData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("Order");
    store.drop(db);
  }
}

// -----------------------------------------------------------------------------

class DatabaseAdmin {
  final String dbname;

  DatabaseAdmin(this.dbname);

  Future<Database> openDatabase() async {
    Directory app = await getApplicationDocumentsDirectory();
    String dbpath = app.path + dbname;
    print(dbpath);
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbpath);
    return db;
  }

  addAdmin(Admin admin) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("User");
    var date = DateFormat.yMd(admin.DateLogin).add_Hm().toString();
    var keyID = store.add(db, {
      'ID':admin.ID,
      'Name_Device':admin.Name_Device,
      'DateLogin':admin.DateLogin,
      'Name':admin.Name,
      'Tel':admin.Tel,
      'Position':admin.Position,
      'Image_URL':admin.Image_URL,
    });
    print('KeyID' + keyID.toString());
    db.close();
  }
  addShop(Shop shop) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("User");
    var date = DateFormat.yMd(shop.DateLogin).add_Hm().toString();
    var keyID = store.add(db, {
      'ID': shop.ID,
      'IP': shop.IP,
      'Name_Device': shop.Name_Device,
      'DateLogin': shop.DateLogin,
      'Name_Shop': shop.Name_Shop,
      'Name_Owner': shop.Name_Owner,
      'Tel': shop.Tel,
      'Address': shop.Address,
      'Image_URL': shop.Image_URL,
      'Email': shop.Email,
      'GPS': shop.GPS,
    });
    print('KeyID' + keyID.toString());
    db.close();
  }

  Future<dynamic> loadAllDataAdmin() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("User");
    var snapshot = await store.find(db);
    List admin = List<Admin>();
    for (var record in snapshot) {
      admin.add(Admin(
        ID: record['ID'],
        Name_Device: record['Name_Device'],
        DateLogin: record['DateLogin'],
        Name: record['Name'],
        Tel: record['Tel'],
        Position: record['Position'],
        Image_URL: record['Image_URL'],
      ));
    }
    return admin;
  }

  Future<dynamic> loadAllDataShop() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("User");
    var snapshot = await store.find(db);
    List shop = List<Shop>();
    for (var record in snapshot) {
      shop.add(Shop(
       ID: record['ID'],
       IP: record['IP'],
        Name_Device: record['Name_Device'],
        DateLogin: record['DateLogin'],
        Name_Owner: record['Name_Owner'],
        Name_Shop: record['Name_Shop'],
        Tel: record['Tel'],
        Address: record['Address'],
        Image_URL: record['Image_URL'],
        Email: record['Email'],
        GPS: record['GPS'],
      ));
    }
    return shop;
  }

  Future clearData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("User");
    store.drop(db);
  }
}
