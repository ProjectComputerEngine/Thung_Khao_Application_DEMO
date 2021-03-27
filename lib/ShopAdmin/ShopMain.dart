import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/ShopAdmin/Widget/ShopMainWidget.dart';
import 'package:minimize_app/minimize_app.dart';
import '../Login/Login.dart';
import 'UpdatePersonalShop.dart';
import 'Widget/BottonNavigationBarShopWidget.dart';

class ShopMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShopMainState();
  }
}

class ShopMainState extends State<ShopMain> {

  // var ShopData;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    print('Dispose Personal Shop Complete');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>MinimizeApp.minimizeApp(),
      child: Scaffold(
        bottomNavigationBar: MenuNavigation(),
        body: Container(
          margin: MediaQuery.of(context).padding,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('res/Background.png'), fit: BoxFit.cover),
                ),
              ),

                   Container(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.01,
                            0,
                            MediaQuery.of(context).size.width * 0.01,
                            0),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 1,

                        child: Column(children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              children: [
                                BackButton(color: Colors.white,),
                                Flexible(child: Container()),
                              ],
                            ),
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height * 0.08),
                          Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage('http://128.199.110.176:8080/upload/img/8images.jpeg'),
                              )),
                          TextName(
                            SelfNameText: 'ร้านคุณย่ายขายทุกอย่าง',
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          TextUnderName(
                            FrontText: ('ชื่อเจ้าของ'),
                            EndText: 'คุณสมหญิง ยอดหญิง',
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          TextUnderName(
                            FrontText: ('เบอร์โทร'),
                            EndText: ' 098-000-0000',
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          TextUnderName(
                            FrontText: ('อีเมล'),
                            EndText: 'xxxx@gmail.com',
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          TextUnderName(
                            FrontText: ('GPS'),
                            EndText: 'xxxx,xxxxx',
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          PlaceText(
                            TextPLACE: '-------------------------------------------------------------------------------',
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.12,
                          ),
                          ClickButton(
                            event: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdatePersonalShop())),
                            TextButton: ('แก้ไขโปรไฟล์'),
                          ),
                          ClickButton(
                            event: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginMain())),
                            TextButton: ('ออกจากระบบ'),

                          ),
                        ]),
                      )
            ],
          ),
        ),
      ),
    );
  }
}