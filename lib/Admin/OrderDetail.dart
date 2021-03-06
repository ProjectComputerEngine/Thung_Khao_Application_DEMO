import './Widget/OrderDetailWidget.dart';
import 'package:flutter/material.dart';

import 'Widget/BottonNavigationBarAdminWidget.dart';

class OrderDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OderDetailStatus();
  }
}

class OderDetailStatus extends State<OrderDetail> {
  @override
  void initState() {

    super.initState();
  }
  @override
  void dispose() {
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
                    image: AssetImage("res/BackgroundShop.png"),
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
                              Card(
                                shape: CircleBorder(),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.16,
                                  width:
                                      MediaQuery.of(context).size.width * 0.16,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.48,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    NameText(),
                                    DateAndTime(
                                      DateANDTimeFont:
                                          '????????????????????????????????? ????????? 18 ?????????????????? 2564',
                                    ),
                                    DateAndTime(
                                      DateANDTimeFont: '???????????? 23.20 ???.',
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Order #001',
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
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.01,
                            0,
                            MediaQuery.of(context).size.width * 0.01,
                            0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '??????????????????????????????',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
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
                                TextTitle: '??????????????????',
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8))),
                                alignment: Alignment.center,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Card(
                                          child: Container(
                                            height: MediaQuery.of(context).size.height * 0.12,
                                            child: Row(
                                              children: [
                                                Card(
                                                  shape: CircleBorder(),
                                                  child: Container(
                                                    height:
                                                    MediaQuery.of(context).size.height * 0.16,
                                                    width:
                                                    MediaQuery.of(context).size.width * 0.16,
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context).size.width * 0.48,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      NameText(),
                                                      DateAndTime(
                                                        DateANDTimeFont:
                                                        '???????????? 1235   ???????????????  12 ?????????',
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.centerRight,
                                                  child: Text(
                                                    '????????????????????? \n 1,235 ',
                                                    style: TextStyle(
                                                        color: Colors.red, fontSize: 14),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.01,
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
                              TextTitle: '???????????????',
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8))),
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      StatusOfBill(
                                        TypeOfStatus: '??????????????????????????????',
                                      ),
                                      StatusOnBILL(),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      StatusOfBill(
                                        TypeOfStatus: '??????????????????????????????',
                                      ),
                                      StatusOnBILL(),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      StatusOfBill(
                                        TypeOfStatus: '?????????????????????????????????',
                                      ),
                                      StatusOnBILL(),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      AcessToStatus(
                        TextStatusINButton: '???????????????????????????????????????????????????',
                      ),
                      AcessToStatus(
                        TextStatusINButton: '???????????????????????????????????????????????????',
                      ),
                      AcessToStatus(
                        TextStatusINButton: '??????????????????????????????????????????????????????',
                      ),
                      AcessToStatus(
                        TextStatusINButton: '??????????????????????????????????????????????????????',
                      ),
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
