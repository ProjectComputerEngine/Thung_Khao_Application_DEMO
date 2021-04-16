import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Connect/Module/ShopAdmin.dart';
import 'package:thung_khao_rbac/ShopAdmin/Widget/ShopMainWidget.dart';
import 'package:minimize_app/minimize_app.dart';
import '../Login/Login.dart';
import 'UpdatePersonalShop.dart';
import 'Widget/BottonNavigationBarShopWidget.dart';


import 'package:provider/provider.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Login.dart';
class ShopMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShopMainState();
  }
}

class ShopMainState extends State<ShopMain> {
  int page = 4;
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
  Future<void> logout() async {
    await Provider.of<LoginConnection>(context,listen: false).logout();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
        builder: (context) => LoginMain()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>MinimizeApp.minimizeApp(),
      child: Scaffold(
        bottomNavigationBar: MenuNavigation(page: page,),
        body: Container(
          margin: MediaQuery.of(context).padding,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('res/BackgroundShop.png'), fit: BoxFit.cover),
                ),
              ),

                  FutureBuilder<Shop>(
                     future: Provider.of<LoginConnection>(context).showShopData(),
                     builder: (context, snapshot) {
                       if(snapshot.hasData){
                        if(snapshot.data != 'error') {
                        return Container(
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
                                  BackButton(
                                    color: Colors.white,
                                  ),
                                  Flexible(child: Container()),
                                ],
                              ),
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.08),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(snapshot.data.Image_URL),
                                )),
                            TextName(
                              SelfNameText: snapshot.data.Name_Shop,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            TextUnderName(
                              FrontText: ('ชื่อเจ้าของ'),
                              EndText: snapshot.data.Name_Owner,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            TextUnderName(
                              FrontText: ('เบอร์โทร'),
                              EndText: snapshot.data.Tel,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            TextUnderName(
                              FrontText: ('อีเมล'),
                              EndText: snapshot.data.Email,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            TextUnderName(
                              FrontText: ('GPS'),
                              EndText: snapshot.data.GPS,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            TextUnderName(
                              FrontText: ('เข้าสู่ระบบล่าสุด'),
                              EndText: snapshot.data.DateLogin,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            PlaceText(
                              TextPLACE:
                                  snapshot.data.Address,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.12,
                            ),
                            ClickButton(
                              event: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UpdatePersonalShop( shop: snapshot.data))),
                              TextButton: ('แก้ไขโปรไฟล์'),
                            ),
                            ClickButton(
                              event: () => logout(),
                              TextButton: ('ออกจากระบบ'),
                            ),
                          ]),
                        );
                      }
                        else{
                          return Center(child: Text('เกิดข้อผิดพลาดทางเครือข่าย กรุณาลองใหม่อีกครั้ง'),);
                        }
                    }
                       else{
                         return Center(child: CircularProgressIndicator(),);
                       }
                  }
                   )
            ],
          ),
        ),
      ),
    );
  }
}