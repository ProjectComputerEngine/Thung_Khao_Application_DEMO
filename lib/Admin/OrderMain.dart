import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Admin/Widget/BottonNavigationBarAdminWidget.dart';
import './Widget/OrderMainWidget.dart';
import 'AdminMain.dart';

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
          context, MaterialPageRoute(builder: (context) => AdminMain())),
      child: Scaffold(
        bottomNavigationBar: MenuNavigation(),
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
                                    TextInButtons: ('??????????????????????????????'),
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
                                    TextInButtons: ('???????????????'),
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
                                    TextInButtons: ('???????????????'),
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
                                    TextInButtons: ('??????????????????'),
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
                                    TextInButtons: ('??????????????????'),
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
                                    TextInButtons: ('???????????????????????????'),
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
                            image: AssetImage("res/Background.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      child: FutureBuilder(
                        future: Future.value(true),
                        builder: (context, snapshost) {
                          if (snapshost.hasData) {
                            return ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return OrderItem(
                                    UrlImage:
                                    'https://i.pinimg.com/474x/51/59/4d/51594d7ca12505563ceaa6553cc69f3c.jpg',
                                    Date: '12/1/60',
                                    IDOrder: '0',
                                    NameOwner: 'Samart',
                                    Status: '???????????????',
                                  );
                                });
                          } else {
                            return CircularProgressIndicator();
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
