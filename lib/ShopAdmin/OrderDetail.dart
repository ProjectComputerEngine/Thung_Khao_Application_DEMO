import 'dart:async';

import 'package:thung_khao_rbac/Configuration.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Order.dart';
import 'package:thung_khao_rbac/Connect/Module/Order.dart';
import 'package:thung_khao_rbac/Connect/Module/OrderDetail.dart';

import './Widget/OrderDetailWidget.dart';
import 'package:flutter/material.dart';

import 'Widget/BottonNavigationBarShopWidget.dart';
import 'package:provider/provider.dart';

class OrderDetail extends StatefulWidget {
  final String id;
  final Order bill;

  const OrderDetail({Key key, this.id, this.bill}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OderDetailStatus();
  }
}

class OderDetailStatus extends State<OrderDetail> {
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
    print('Dispose Order Detail');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MenuNavigation(),
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
                        child: Column(
                          children: [
                            BacksButton(),
                            MassageTitle(),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.001,
                      ),
                      Card(
                        color: Color.fromRGBO(6, 243, 186, 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                child: ClipOval(
                                    child:
                                        Image.network(widget.bill.Image_URL)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.48,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    NameText(name: widget.bill.Name),
                                    DateAndTime(
                                      DateANDTimeFont: widget.bill.Date,
                                    ),
                                    StatusOnBILL(
                                      status: widget.bill.Status,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '#Order ${widget.id}',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 14),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.001,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.01,
                              0,
                              MediaQuery.of(context).size.width * 0.01,
                              0),
                          child: Column(
                            children: [
                              TitleBox(
                                TextTitle: 'สินค้า',
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8))),
                                alignment: Alignment.center,
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                child: FutureBuilder(
                                    future:
                                        Provider.of<OrderConnection>(context)
                                            .showDetailOrder(widget.id),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        if (snapshot.data) {
                                          List<DetailOrder> bill =
                                              Provider.of<OrderConnection>(
                                                      context)
                                                  .detailList;
                                          return ListView.builder(
                                              itemCount:
                                                  Provider.of<OrderConnection>(
                                                          context)
                                                      .detailList
                                                      .length,
                                              itemBuilder: (context, index) {
                                                sumPrice = 0;
                                                sum.isClosed
                                                    ? null
                                                    : sum.add(double.parse(
                                                            bill[index].Num) *
                                                        double.parse(
                                                            bill[index].Price));
                                                index == bill.length - 1
                                                    ? sum.close()
                                                    : null;
                                                return ProductItem(
                                                    bill: bill[index]);
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
                              Text(SUM.toString()),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
