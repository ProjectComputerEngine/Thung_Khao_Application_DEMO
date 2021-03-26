import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Admin/AdminMain.dart';
import 'package:thung_khao_rbac/Admin/Chat.dart';
import 'package:thung_khao_rbac/Admin/Widget/BottonNavigationBarAdminWidget.dart';
import './Widget/InboxWidget.dart';

class InboxMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InboxState();
  }
}

class InboxState extends State<InboxMain> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    print('Dispose Inbox Complete');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AdminMain())),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(32, 50, 50, 10),
        body: Container(
            margin: MediaQuery.of(context).padding,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  color: Color.fromRGBO(42, 64, 87, 10),
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      0,
                      MediaQuery.of(context).size.width * 0.05,
                      0),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BackButton(
                                  color: Colors.white,
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.refresh_sharp,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    })
                              ])),
                      MassageTitle(),
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
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      child: FutureBuilder(
                        future: Future.value(true),
                        builder: (context, snapshost) {
                          if (snapshost.hasData) {
                            return ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              itemCount: 10,
                                itemBuilder: (context, index) {
                              return MessageButtons(
                                gotoMessage: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatBoxMain())),
                                time: '20/03/2390',
                                imageurl:
                                    'http://128.199.110.176:8080/upload/img/8images.jpeg',
                                lastmessage: 'ทดสอบ',
                                nameUesr: 'คุณสมหญิงยอดหญิง',
                                NewMessgeText: 'fff',
                                NewNameColor: Colors.white,
                                TimeColor: Colors.white,
                                NewColorText: Colors.red,
                                ChangeColorsCircle: Colors.white,
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
            )),
        bottomNavigationBar: MenuNavigation(),
      ),
    );
  }
}
