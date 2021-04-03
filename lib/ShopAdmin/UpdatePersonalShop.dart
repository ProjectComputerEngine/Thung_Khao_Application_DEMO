import 'package:thung_khao_rbac/Connect/Module/ShopAdmin.dart';
import 'package:thung_khao_rbac/ShopAdmin/BackEnd/UpdatePersonalShopBackend.dart';
import 'package:thung_khao_rbac/ShopAdmin/ShopMain.dart';

import './Widget/UpdatePersonalShopWidget.dart';
import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/ShopAdmin/Widget/BottonNavigationBarShopWidget.dart';

import 'package:rxdart/subjects.dart';

class UpdatePersonalShop extends StatefulWidget {
  final Shop shop;

  const UpdatePersonalShop({Key key, this.shop}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UpdatePersonalShopState();
  }
}

class UpdatePersonalShopState extends State<UpdatePersonalShop> {
  TextEditingController nameShopController;

  TextEditingController nameOwnerController;

  TextEditingController telController;

  TextEditingController emailController;

  TextEditingController gpsController;

  TextEditingController addressController;

  BehaviorSubject subjectImagePath;

  @override
  void initState() {
    subjectImagePath = BehaviorSubject();

    nameShopController = TextEditingController(text: widget.shop.Name_Shop);
    nameOwnerController = TextEditingController(text: widget.shop.Name_Owner);
    telController = TextEditingController(text: widget.shop.Tel);
    emailController = TextEditingController(text: widget.shop.Email);
    gpsController = TextEditingController(text: widget.shop.GPS);
    addressController = TextEditingController(text: widget.shop.Address);

    super.initState();
  }

  @override
  void dispose() {
    subjectImagePath.close();
    print('Dispose Update Personal Admin ');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ShopMain())),
      child: Scaffold(
        bottomNavigationBar: MenuNavigation(),
        body: Container(
          margin: MediaQuery.of(context).padding,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('res/BackgroundAdmin.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    0,
                    MediaQuery.of(context).size.width * 0.05,
                    0),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
                child: StreamBuilder(
                    stream: subjectImagePath.stream,
                    builder: (context, snapshot) {
                      Widget image;
                      if (snapshot.hasData) {
                        image = ClipOval(
                          child: Image.file(snapshot.data,fit: BoxFit.cover,),
                        );
                      } else {
                        image = ClipOval(
                          child: Image.network(widget.shop.Image_URL,fit: BoxFit.cover,),
                        );
                      }

                      return ListView(children: [
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
                        Container(
                            height: MediaQuery.of(context).size.height * 0.08),
                        FlatButton(
                          onPressed: ()=>ReadFildPath(subjectImagePath),
                          child: Container(
                              height:
                              MediaQuery.of(context).size.height * 0.2  ,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: image),
                        ),
                        TextFormField(
                          controller: nameShopController,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        TextFormField(
                          controller: nameOwnerController,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        TextFormField(
                          controller: telController,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        TextFormField(
                          controller: emailController,
                        ),
                        TextFormField(
                          controller: gpsController,
                        ),
                        TextFormField(
                          controller: addressController,
                        ),
                        ClickButton(
                          TextButton: ('บันทึกขอมูล'),
                          event: () => UpdatePersonalShopData(
                              context,
                              nameShopController.text,
                              nameOwnerController.text,
                              telController.text,
                              gpsController.text,
                              emailController.text,
                              addressController.text,
                              snapshot.data == null
                                  ? widget.shop.Image_URL
                                  : snapshot.data.path,
                              widget.shop.ID,
                              widget.shop),
                        ),
                        ClickButton(
                          TextButton: ('ยกเลิก'),
                          event: () => showMyDialogYN(context,
                              'คุณต้องการจะยกเลิกการเปลี่ยนเเปลงหรือไม่'),
                        ),
                      ]);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
