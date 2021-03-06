import 'dart:async';
import './Widget/StorageDetailWidget.dart';
import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Admin/Widget/BottonNavigationBarAdminWidget.dart';
class StorageDetail extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return StorageDetailStatus();
  }
}

class StorageDetailStatus extends State<StorageDetail> {

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  // TextEditingController dateStartController = TextEditingController();
  TextEditingController storageController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController recommendController = TextEditingController();
  TextEditingController numController = TextEditingController();

  FocusNode nameNode;
  FocusNode priceNode;
  FocusNode weightNode;
  FocusNode widthNode;
  FocusNode heightNode;
  FocusNode numNode;
  FocusNode dateStartNode;
  FocusNode storageNode;
  FocusNode recommendNode;
  FocusNode noteNode;
  FocusNode saveNode;

  DateTime startDate;
  DateTime selectDate;

  // BehaviorSubject streamController;



  @override
  void initState() {
    // streamController = BehaviorSubject();
    startDate = DateTime.now();

    nameNode = FocusNode();
    priceNode = FocusNode();
    weightNode = FocusNode();
    widthNode = FocusNode();
    heightNode = FocusNode();
    numNode = FocusNode();
    dateStartNode = FocusNode();
    storageNode = FocusNode();
    recommendNode = FocusNode();
    noteNode = FocusNode();
    saveNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // streamController.close();
    print('steam complete !');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MenuNavigation(),
      body: Container(
        margin: MediaQuery.of(context).padding,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01,0,MediaQuery.of(context).size.width*0.01,0),
              color: Color.fromRGBO(42, 64, 87, 5),
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                children: [BackButton(color: Colors.white,), AddProductText()],
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
                ListView(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      0,
                      MediaQuery.of(context).size.width * 0.05,
                      0),
                  children: [
                    Container(
                      child: Text(
                        '?????????',
                        textAlign: TextAlign.left,
                        style: TextStyle(),
                      ),
                    ),
                    SpaceHeight(),
                    Container(
                        child:Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            LargeImageBox(
                                content: Image.network('http://128.199.110.176:8080/upload/img/8images.jpeg')),
                            SpaceWidth(),
                            TwoImageBox(
                                contact: Image.network('http://128.199.110.176:8080/upload/img/8images.jpeg')),
                            SpaceWidth(),
                            TwoImageBox(
                                contact: Image.network('http://128.199.110.176:8080/upload/img/8images.jpeg')),
                          ],
                        )
                    ),
                    SpaceHeight(),
                    Container(
                      child: Text(
                        '??????????????????????????????',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SpaceHeight(),
                    SpaceHeight(),
                    Container(
                      decoration: BoxDecoration(
                          border:
                          Border.all(color: Color.fromRGBO(32, 50, 50, 10)),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          SpaceHeight(),
                          SpaceHeight(),
                          ProductNameTextField(
                            enable: true,
                            value: '???????????????????????????',
                            myNode: nameNode,
                            nextNode: priceNode,
                            name: nameController,
                          ),
                          PriceTextField(
                            enable: true,
                            value: '10000',
                            myNode: priceNode,
                            nextNode: weightNode,
                            price: priceController,
                          ),
                          WeightTextField(
                            enable: true,
                            value: '10',
                            myNode: weightNode,
                            nextNode: widthNode,
                            weight: weightController,
                          ),
                          SpaceText(),
                          SizePacketText(),
                          SpaceText(),
                          SizePacketTextField(
                            enable: true,
                            value1: '10',
                            value2:'20',
                            width: widthController,
                            height: heightController,
                            my1Node: widthNode,
                            my2Node: heightNode,
                            nextNode: numNode,
                          ),
                          SpaceText(),
                          IncressProductText(),
                          SpaceText(),
                          IncressProductTextField(
                            value: '200',
                            myNode: numNode,
                            nextNode: dateStartNode,
                            num: numController,
                          ),
                          ProductionDateTextField(
                              myNode: dateStartNode,
                              dateselect: (){},
                              dateshow: '20-20-20'),
                          PlaceTextField(
                            value: '- ????????????',
                            myNode: storageNode,
                            nextNode: recommendNode,
                            storage: storageController,
                          ),
                          RecommendTextField(
                            value: ' ???????????????',
                            myNode: recommendNode,
                            nextNode: noteNode,
                            recommend: recommendController,
                          ),
                          NoteTextField(
                            value: ' ???????????????',
                            myNode: noteNode,
                            nextNode: saveNode,
                            note: noteController,
                          ),
                          SaveBUTTON(myNode: saveNode,)
                        ],
                      ),
                    ),
                  ],
                ),
              ]),)
          ],
        ),
      ),
    );
  }
}

