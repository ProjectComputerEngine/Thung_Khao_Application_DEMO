import 'dart:async';
import 'package:thung_khao_rbac/Connect/Module/Product.dart';
import 'package:thung_khao_rbac/ShopAdmin/BackEnd/StorageDetailBackend.dart';

import './Widget/StoratgeDetailWidget.dart';
import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/ShopAdmin/Widget/BottonNavigationBarShopWidget.dart';
import './BackEnd/UpdatePersonalShopBackend.dart';

class StorageDetail extends StatefulWidget {
  final Product productDetail;

  const StorageDetail({Key key, this.productDetail}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StorageDetailStatus();
  }
}

class StorageDetailStatus extends State<StorageDetail> {
  TextEditingController nameController;
  TextEditingController priceController;
  TextEditingController weightController;
  TextEditingController widthController;
  TextEditingController heightController;
  TextEditingController storageController;
  TextEditingController noteController;
  TextEditingController recommendController;
  TextEditingController numController;
  TextEditingController num;

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
  int numitem = 1;

  void addCount() {
    setState(() {
      numitem++;
      num.text = numitem.toString();
      print(numitem.toString());
    });
  }

  void commitCount() {
    setState(() {
      numitem = int.parse(num.text);
      print(numitem.toString());
    });
  }

  void negativeCount() {
    setState(() {
      numitem < 2 ? null : numitem--;
      num.text = numitem.toString();
      print(numitem.toString());
    });
  }

  @override
  void initState() {
    // streamController = BehaviorSubject();
    wxh = widget.productDetail.Size.split('X');
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

    nameController = TextEditingController(text: widget.productDetail.Name);
    priceController = TextEditingController(text: widget.productDetail.Price);
    weightController = TextEditingController(text: widget.productDetail.Weight);
    widthController = TextEditingController(text: wxh[0]);
    heightController = TextEditingController(text: wxh[1]);
    storageController =
        TextEditingController(text: widget.productDetail.Storage);
    noteController = TextEditingController(text: widget.productDetail.Note);
    recommendController =
        TextEditingController(text: widget.productDetail.Recommend);
    numController = TextEditingController(text: widget.productDetail.Num);
    num = TextEditingController(text: numitem.toString());
    super.initState();
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
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.01,
                  0,
                  MediaQuery.of(context).size.width * 0.01,
                  0),
              color: Color.fromRGBO(42, 64, 87, 5),
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                children: [
                  BackButton(
                    color: Colors.white,
                  ),
                  AddProductText(
                    title: widget.productDetail.Name,
                  )
                ],
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
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        LargeImageBox(
                            content:
                                Image.network(widget.productDetail.UrlImage1)),
                        SpaceWidth(),
                        TwoImageBox(
                            contact:
                                Image.network(widget.productDetail.UrlImage1)),
                        SpaceWidth(),
                        TwoImageBox(
                            contact:
                                Image.network(widget.productDetail.UrlImage1)),
                      ],
                    )),
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
                            myNode: nameNode,
                            nextNode: priceNode,
                            name: nameController,
                          ),
                          PriceTextField(
                            myNode: priceNode,
                            nextNode: weightNode,
                            price: priceController,
                          ),
                          WeightTextField(
                            myNode: weightNode,
                            nextNode: widthNode,
                            weight: weightController,
                          ),
                          SpaceText(),
                          SizePacketText(),
                          SpaceText(),
                          SizePacketTextField(
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
                            myNode: numNode,
                            nextNode: dateStartNode,
                            num: numController,
                          ),
                          PlaceTextField(
                            myNode: storageNode,
                            nextNode: recommendNode,
                            storage: storageController,
                          ),
                          RecommendTextField(
                            myNode: recommendNode,
                            nextNode: noteNode,
                            recommend: recommendController,
                          ),
                          NoteTextField(
                            myNode: noteNode,
                            nextNode: saveNode,
                            note: noteController,
                          ),
                          Row(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () => addCount()),
                              Flexible(
                                  child: TextFormField(
                                controller: num,
                                onEditingComplete: () => commitCount(),
                              )),
                              IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () => negativeCount()),
                              TextButton(
                                  onPressed: () => addOrder(
                                      context,
                                      widget.productDetail.ID,
                                      widget.productDetail.Name,
                                      numitem.toString(),
                                      widget.productDetail.Price,
                                      widget.productDetail.UrlImage1,

                                  ),
                                  child: Text('Enter'))
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
