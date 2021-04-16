import 'dart:async';

import 'package:thung_khao_rbac/Configuration.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Bill.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Login.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Order.dart';
import 'package:thung_khao_rbac/ShopAdmin/BackEnd/CartBackend.dart';
import 'package:thung_khao_rbac/ShopAdmin/StorageMain.dart';

import './Widget/CartWidget.dart';
import 'package:flutter/material.dart';

import 'Widget/BottonNavigationBarShopWidget.dart';

import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CartState();
  }
}

class CartState extends State<Cart> {
  StreamController<double> sum = StreamController();
  double SUM = 0;
  double sumPrice = 0;
  int page = 1;

  @override
  void initState() {
    SUM = 0;
    sum.stream.listen((value) {
      print(value.toString());
      SUM += value;
      setState(() {});
    }).onDone(() {
      // setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    sum.close();
    print('Dispose Cart Complete');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => StorageMain())),
      child: Scaffold(
        bottomNavigationBar: MenuNavigation(page: page,),
        body: Form(
            child: Container(
          margin: MediaQuery.of(context).padding,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("res/BackgroundAdmin.png"),
                      fit: BoxFit.cover),
                ),
              ),
              ListView(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.025,
                        0,
                        MediaQuery.of(context).size.width * 0.025,
                        0),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.01,
                              0,
                              MediaQuery.of(context).size.width * 0.01,
                              0),
                          child: Row(
                            children: [
                              BacksButton(),
                              MassageTitle(),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.001,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.001,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        TitleBox(
                          TextTitle: 'สินค้า',
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8))),
                          child: FutureBuilder(
                              future: Provider.of<OrderConnection>(context)
                                  .selectAllBill(
                                      Provider.of<LoginConnection>(context)
                                          .shop
                                          .ID),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data) {
                                    List<Bill> bill =
                                        Provider.of<OrderConnection>(context)
                                            .billList;
                                    return ListView.builder(
                                        itemCount: Provider.of<OrderConnection>(
                                                context)
                                            .billList
                                            .length,
                                        itemBuilder: (context, index) {
                                          sumPrice = 0;
                                          sum.isClosed
                                              ? null
                                              : sum.add(double.parse(
                                                      bill[index].num) *
                                                  double.parse(
                                                      bill[index].price));
                                          index == bill.length - 1
                                              ? sum.close()
                                              : null;
                                          return ProductItem(bill: bill[index]);
                                        });
                                  } else {
                                    SUM = 0;
                                    return Center(
                                      child: Text(
                                        'ไม่พบข้อมูล',
                                        style: TextStyle(
                                            fontSize: Config.Error_fontH),
                                      ),
                                    );
                                  }
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(SUM.toString()),
                              TextButton(
                                  onPressed: () => clearCart(context),
                                  child: Text('ล้าง')),
                              TextButton(
                                  onPressed: () => SUM == 0.0? showMyDialogY(context, 'กรุณาเลือกสินค้าก่อนส่งคำสั่งซื้อ'):sendOrder(context,SUM.toString()),
                                  child: Text('ส่งคำสั่งซื้อ'))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
