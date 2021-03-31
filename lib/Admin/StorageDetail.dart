import 'dart:async';
import 'package:thung_khao_rbac/Connect/Module/Product.dart';

import './Widget/StorageDetailWidget.dart';
import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Admin/Widget/BottonNavigationBarAdminWidget.dart';
class StorageDetail extends StatefulWidget {
final Product productDetail;

  const StorageDetail({Key key, this.productDetail}) : super(key: key);

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

  List<String> wxh;


  @override
  void initState() {
    // streamController = BehaviorSubject();
    // wxh = widget.productDetail.Size.split('x');
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
  _selectDate(BuildContext context, FocusNode nextNode) async {
    selectDate = await showDatePicker(
      context: context,
      initialDate: startDate, // Refer step 1
      firstDate: DateTime(startDate.year - 5),
      lastDate: DateTime(startDate.year + 5),
    );
    if (selectDate != null) {
      nextNode.requestFocus();
    }
    setState(() {});
  }

  @override
  void dispose() {
    // streamController.close();
    print('Dispose Storage Detail');
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
                        image: AssetImage("res/BackgroundAdmin.png"),
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
                        'รูป',
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
                                content: Image.network(widget.productDetail.UrlImage1)),
                            SpaceWidth(),
                            TwoImageBox(
                                contact: Image.network(widget.productDetail.UrlImage1)),
                            SpaceWidth(),
                            TwoImageBox(
                                contact: Image.network(widget.productDetail.UrlImage1)),
                          ],
                        )
                    ),
                    SpaceHeight(),
                    Container(
                      child: Text(
                        'รายละเอียด',
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
                            value: widget.productDetail.Name,
                            myNode: nameNode,
                            nextNode: priceNode,
                            name: nameController,
                          ),
                          PriceTextField(
                            enable: true,
                            value: widget.productDetail.Price,
                            myNode: priceNode,
                            nextNode: weightNode,
                            price: priceController,
                          ),
                          WeightTextField(
                            enable: true,
                            value: widget.productDetail.Weight,
                            myNode: weightNode,
                            nextNode: widthNode,
                            weight: weightController,
                          ),
                          SpaceText(),
                          SizePacketText(),
                          SpaceText(),
                          SizePacketTextField(
                            enable: true,
                            value1: 'wxh[0]',
                            value2: 'wxh[1]',
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
                            value: widget.productDetail.Num,
                            myNode: numNode,
                            nextNode: dateStartNode,
                            num: numController,
                          ),
                          ProductionDateTextField(
                              myNode: dateStartNode,
                              dateselect: ()=>_selectDate(context,storageNode),
                              dateshow: widget.productDetail.DateStart),
                          PlaceTextField(
                            value: widget.productDetail.Storage,
                            myNode: storageNode,
                            nextNode: recommendNode,
                            storage: storageController,
                          ),
                          RecommendTextField(
                            value: widget.productDetail.Recommend,
                            myNode: recommendNode,
                            nextNode: noteNode,
                            recommend: recommendController,
                          ),
                          NoteTextField(
                            value: widget.productDetail.Note,
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

