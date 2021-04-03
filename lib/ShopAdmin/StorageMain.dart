import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/ShopAdmin/ShopMain.dart';
import 'package:thung_khao_rbac/ShopAdmin/StorageDetail.dart';
import 'package:thung_khao_rbac/ShopAdmin/Widget/BottonNavigationBarShopWidget.dart';
import 'package:thung_khao_rbac/Configuration.dart';
import 'package:thung_khao_rbac/Connect/Module/Product.dart';
import './Widget/StorageMainWidget.dart';

import 'package:thung_khao_rbac/Connect/BackEnd/Product.dart';
import 'package:provider/provider.dart';

class StorageMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StorageStatus();
  }
}

class StorageStatus extends State<StorageMain> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ShopMain())),
      child: Scaffold(
          bottomNavigationBar: Container(
            height: MediaQuery.of(context).size.height * 0.08,
            color: Colors.white,
            child: MenuNavigation(),
          ),
          body: Container(
            margin: MediaQuery.of(context).padding,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Color.fromRGBO(42, 64, 87, 5),
                  child: Row(
                    children: [
                      BackButton(
                        color: Colors.white,
                      ),
                      ProductText(),
                    ],
                  ),
                ),

                //---------------//
                Flexible(
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("res/BackgroundAdmin.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                          child: FutureBuilder<bool>(
                            future: Provider.of<ProductConnection>(context).showAllProduct(),
                            builder: (context, snapshost) {
                              if (snapshost.hasData) {
                                if(snapshost.data){
                                  List<Product> product = Provider.of<ProductConnection>(context).product;
                                  List<Widget> list = [];
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, index) {
                                      list.clear();
                                      if (index % 2 == 0) {
                                        if (index < product.length) {
                                          list.add(Flexible(
                                            child: ProductItem(
                                              goToDetail: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            StorageDetail(productDetail: product[index],)));
                                              },
                                              name:
                                              product[index].Name,
                                              price: product[index].Price,
                                              num: product[index].Num,
                                              imageUrl:
                                              product[index].UrlImage1,
                                            ),
                                          ));
                                        }
                                        if (index + 1 < product.length) {
                                          list.add(Flexible(
                                            child: ProductItem(
                                              goToDetail: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            StorageDetail(productDetail: product[index+1],)));
                                              },
                                              name:
                                              product[index+1].Name,
                                              price: product[index+1].Price,
                                              num: product[index+1].Num,
                                              imageUrl:
                                              product[index+1].UrlImage1,),
                                          ));
                                        } else {
                                          list.add(Flexible(child: Container()));
                                        }
                                      }
                                      return Row(
                                        children: list,
                                      );
                                    },
                                    itemCount: product.length,
                                  );
                                }
                                else{
                                  return Center(child: Text('เกิดข้อผิดพลาดทางเครือข่าย',style: TextStyle(fontSize:Config.Error_fontH),),);
                                }
                              } else if (snapshost.hasError) {
                                return Center(
                                  child: Text('เกิดข้อผิดพลาดทางเครือข่าย',style: TextStyle(fontSize:Config.Error_fontH)),
                                );
                              } else {
                                return Center(child: CircularProgressIndicator());
                              }
                            },
                          )),
                    ]))
              ],
            ),
          ),
        // Container(
        //   alignment: Alignment.bottomCenter,
        //   child: AddButton(
        //     GotoNewproduct: () => {},
        //   ),
        // ),
      ),
    );
  }
}
