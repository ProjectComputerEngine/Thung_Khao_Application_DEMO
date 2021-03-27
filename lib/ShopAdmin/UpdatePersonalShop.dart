import './Widget/UpdatePersonalShopWidget.dart';
import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/ShopAdmin/Widget/BottonNavigationBarShopWidget.dart';

class UpdatePersonalShop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UpdatePersonalShopState();
  }
}

class UpdatePersonalShopState extends State<UpdatePersonalShop> {

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    print('Dispose Update Personal Admin ');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //onWillPop: () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>AdminMain())),
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

                child: ListView(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      children: [
                        BackButton(
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Container(height: MediaQuery.of(context).size.height * 0.08),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('res/logo.png'),
                      )),
                  TextFormField(),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  TextFormField(),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextFormField(),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  ClickButton(
                    TextButton: ('บันทึกขอมูล'),
                    event: ()=> Navigator.of(context).pop(),
                  ),
                  ClickButton(
                    TextButton: ('ยกเลิก'),
                    event: ()=> Navigator.of(context).pop(),
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