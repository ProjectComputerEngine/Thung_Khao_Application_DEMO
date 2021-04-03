import 'package:thung_khao_rbac/Configuration.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Order.dart';
import 'package:thung_khao_rbac/ShopAdmin/StorageMain.dart';

import './Widget/CartWidget.dart';
import 'package:flutter/material.dart';

import 'Widget/BottonNavigationBarShopWidget.dart';

import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CartState();
  }
}

class CartState extends State<Cart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    print('Dispose Cart Complete');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> StorageMain())),
      child: Scaffold(
        bottomNavigationBar: MenuNavigation(),
        body: Form(
            child: Container(
          margin: MediaQuery.of(context).padding,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("res/BackgroundAdmin.png"),
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
                          child: Row(
                            children: [
                              BacksButton(),
                              MassageTitle(),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.001,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.001,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        TitleBox(
                          TextTitle: 'สินค้า',
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height*0.5,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8))),
                          child: FutureBuilder(
                              future: Provider.of<OrderConnection>(context).selectAllBill(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  if(snapshot.data){
                                    return ListView.builder(
                                        itemCount: Provider.of<OrderConnection>(context).billList.length,
                                        itemBuilder: (context, index) {
                                          return ProductItem(bill: Provider.of<OrderConnection>(context).billList[index],);
                                        });
                                  }
                                  else{
                                    return Center(child: Text('ไม่พบข้อมูล',style: TextStyle(fontSize: Config.Error_fontH),),);
                                  }
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }),
                        ),
                        Container(
                          child: Row(
                            children: [
                              TextButton(onPressed: ()=>Provider.of<OrderConnection>(context,listen: false).billClear(), child: Text('ล้าง'))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
