import './Widget/LoginWidget.dart';
import 'package:flutter/material.dart';
import 'package:minimize_app/minimize_app.dart';
import 'package:thung_khao_rbac/Admin/AdminMain.dart';
import 'package:thung_khao_rbac/ShopAdmin/ShopMain.dart';
class LoginMain extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginMain> {
  @override
  void dispose() {
    print('Dispose Login Complete');
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>MinimizeApp.minimizeApp(),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(32, 50, 50, 10),
        body: Container(
          margin: MediaQuery.of(context).padding,
          color: Color.fromRGBO(32, 50, 50, 10),
          child: Padding(
            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05, 0,
                MediaQuery.of(context).size.width * 0.05, 0),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ImageLogo(),
                TextAccount(IconCheng: Icons.account_circle),
                Space(
                  EmtySpace: MediaQuery.of(context).size.height * 0.01,
                ),
                TextAccount(IconCheng: Icons.lock),
                Space(
                  EmtySpace: MediaQuery.of(context).size.height * 0.01,
                ),
                ButtonAccessSystem(Goto: ()=>{
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminMain()))
                }),
                TextRegis(),
                Space(
                  EmtySpace: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
