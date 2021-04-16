import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Admin/PersonalAdmin.dart';
import 'package:thung_khao_rbac/Admin/Widget/BottonNavigationBarAdminWidget.dart';
import 'package:thung_khao_rbac/Configuration.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Login.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Order.dart';
import './Widget/OrderMainWidget.dart';

import 'package:provider/provider.dart';
import 'package:thung_khao_rbac/Connect/Module/Order.dart';
class OrderMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BillState();
  }
}

class BillState extends State<OrderMain> {
  int status = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    print('Dispose Order Main Complete');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => PersonalAdminMain())),
      child: Scaffold(
        bottomNavigationBar: MenuNavigation(page: 0,),
        body: Form(
          child: Container(
            margin: MediaQuery.of(context).padding,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.27,
                  color: Color.fromRGBO(255, 234, 79, 10),
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      0,
                      MediaQuery.of(context).size.width * 0.05,
                      0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BackButton(
                        color: Colors.white,
                      ),
                      MassageTitle(),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  TextBillButton(
                                    TextInButtons: ('คำสั่งซื้อ'),
                                    SeleteStatus: () {
                                      setState(() {
                                        status = 0;
                                      });
                                    },
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.001,
                                  ),
                                  TextBillButton(
                                    TextInButtons: ('รอโอน'),
                                    SeleteStatus: () {
                                      setState(() {
                                        status = 1;
                                      });
                                    },
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.0001,
                                  ),
                                  TextBillButton(
                                    TextInButtons: ('รอส่ง'),
                                    SeleteStatus: () {
                                      setState(() {
                                        status = 2;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.0001,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  TextBillButton(
                                    TextInButtons: ('สำเร็จ'),
                                    SeleteStatus: () {
                                      setState(() {
                                        status = 3;
                                      });
                                    },
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.001,
                                  ),
                                  TextBillButton(
                                    TextInButtons: ('ยกเลิก'),
                                    SeleteStatus: () {
                                      setState(() {
                                        status = 4;
                                      });
                                    },
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.001,
                                  ),
                                  TextBillButton(
                                    TextInButtons: ('คืนสินค้า'),
                                    SeleteStatus: () {
                                      setState(() {
                                        status = 5;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("res/BackgroundShop.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      child: FutureBuilder<bool>(
                        future: Provider.of<OrderConnection>(context).selectAllOrder(status.toString(),Provider.of<LoginConnection>(context,listen: false).admin.ID),
                        builder: (context, snapshost) {
                          if (snapshost.hasData) {
                            if(snapshost.data){
                              List<Order> listOrder= Provider.of<OrderConnection>(context).orderList;
                              return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: listOrder.length,
                                  itemBuilder: (context, index) {
                                    return OrderItem(
                                      bill: listOrder[index],
                                      UrlImage:
                                          listOrder[index].Image_URL,
                                      Date:listOrder[index].Date,
                                      IDOrder: listOrder[index].ID,
                                      NameOwner: listOrder[index].Name,
                                      Status: listOrder[index].Status,

                                    );
                                  });
                            }
                            else{
                              return Center(child: Text('เกิดข้อผิดพลาดทางเครือข่าย กรุณาลองใหม่อีกครั้ง',style: TextStyle(fontSize: Config.Error_fontH),),);
                            }
                          } else if(snapshost.connectionState == ConnectionState.waiting){
                            return Center(child: CircularProgressIndicator());
                          }
                          else{
                            return Center(child: Text('ไม่พบข้อมูล',style: TextStyle(fontSize: Config.Error_fontH),),);
                          }
                        },
                      ),
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
