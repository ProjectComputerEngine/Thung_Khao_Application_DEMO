import 'package:thung_khao_rbac/Admin/Widget/BottonNavigationBarAdminWidget.dart';
import 'package:thung_khao_rbac/Login/Login.dart';
import 'package:minimize_app/minimize_app.dart';
import './Widget/AdminMainWidget.dart';
import 'package:flutter/material.dart';

class AdminMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AdminState();
  }
}

class AdminState extends State<AdminMain> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>MinimizeApp.minimizeApp(),
      child: Scaffold(
        backgroundColor:  Color.fromRGBO(32, 50, 50, 10),
        body: Container(
          margin: MediaQuery.of(context).padding,
          child: Padding(
            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,
                0, MediaQuery.of(context).size.width * 0.05, 0),
            child: ListView(
              children: [
                Container(

                  child: FlatButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginMain()));
                    },
                    child: IconButton(
                      icon: Icon(Icons.logout,color: Colors.white,),
                      alignment: Alignment.centerRight,
                    ),
                  ),

                  padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01,0.01,MediaQuery.of(context).size.width*0.01,0.01),
                  alignment: Alignment.centerRight,
                ),
                TextFirstLine(),
                Space(
                  SpaceSize: MediaQuery.of(context).size.height * 0.01,
                ),
                BoxFirstRow(
                  FirstLineFirstColumn: 'ยอดเงิน',
                  SeconeLineFirstColoumn: '99,999,999,999',
                  FirstlineSeconeColumn: 'ผู้สั่งซื้อ',
                  SeconeLineSeconeColoumn: '888,888,888',
                  FirstColumnColor: Color.fromRGBO(245, 9, 9, 10),
                  SeconeColumnColor: Color.fromRGBO(3, 195, 2, 10),
                ),
                Space(
                  SpaceSize: MediaQuery.of(context).size.height * 0.01,
                ),
                BoxFirstRow(
                  FirstLineFirstColumn: 'ยอดเงิน',
                  SeconeLineFirstColoumn: '99,999,999,999',
                  FirstlineSeconeColumn: 'ผู้สั่งซื้อ',
                  SeconeLineSeconeColoumn: '888,888,888',
                  FirstColumnColor: Color.fromRGBO(66, 103, 178, 10),
                  SeconeColumnColor: Color.fromRGBO(243, 191, 6, 10),
                ),
                Space(
                  SpaceSize: MediaQuery.of(context).size.height * 0.01,
                ),
                SupButton(),
                Space(
                  SpaceSize: MediaQuery.of(context).size.height * 0.01,
                ),
                LessProductButton(),
                Container(
                  height: MediaQuery.of(context).size.height * 0.22,
                  color: Colors.white,
                  child: Row(

                    children: [
                      Flexible(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            LessRiceButton(),
                            LessRiceButton(),
                            LessRiceButton(),
                            LessRiceButton(),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: MenuNavigation(),
      ),
    );
  }
}
