import 'dart:async';
import 'package:thung_khao_rbac/Connect/BackEnd/Product.dart';
import 'package:thung_khao_rbac/Connect/Module/Product.dart';

import './Widget/StorageDetailWidget.dart';
import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Admin/Widget/BottonNavigationBarAdminWidget.dart';
import './Backend/StorageDetailBackend.dart';

import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:provider/provider.dart';

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

  // TextEditingController dateStartController = TextEditingController();
  TextEditingController storageController;
  TextEditingController noteController;
  TextEditingController recommendController;
  TextEditingController numController;


  DateTime startDate;
  DateTime selectDate;

  BehaviorSubject streamController;

  List<String> wxh;

  @override
  void initState() {
    streamController = BehaviorSubject();
    wxh = widget.productDetail.Size.split('X');
    startDate = DateTime.now();

    nameController = TextEditingController(text: widget.productDetail.Name);
    priceController = TextEditingController(text: widget.productDetail.Price);
    priceController = TextEditingController(text: widget.productDetail.Price);
    weightController = TextEditingController(text: widget.productDetail.Weight);
    widthController = TextEditingController(text: wxh[0]);
    heightController = TextEditingController(text: wxh[1]);
    storageController  = TextEditingController(text: widget.productDetail.Storage);
    noteController  = TextEditingController(text: widget.productDetail.Note);
    recommendController  = TextEditingController(text: widget.productDetail.Recommend);
    recommendController  = TextEditingController(text: widget.productDetail.Recommend);
    numController  = TextEditingController(text: widget.productDetail.Num);




    super.initState();
  }

  _selectDate(BuildContext context) async {
    selectDate = await showDatePicker(
      context: context,
      initialDate: startDate, // Refer step 1
      firstDate: DateTime(startDate.year - 5),
      lastDate: DateTime(startDate.year + 5),
    );
    if (selectDate != null) {}
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
                StreamBuilder(
                    stream: streamController.stream,
                    builder: (context, snapshot) {
                      Widget contant;
                      if (snapshot.hasData) {
                        contant = Image.file(snapshot.data);
                      } else {
                        contant = Image.network(widget.productDetail.UrlImage1);
                      }
                      return ListView(
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
                                  file_picker: () =>
                                      ReadFildPath(streamController),
                                  content: contant),
                              SpaceWidth(),
                              TwoImageBox(contact: contant),
                              SpaceWidth(),
                              TwoImageBox(contact: contant),
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
                                border: Border.all(
                                    color: Color.fromRGBO(32, 50, 50, 10)),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                SpaceHeight(),
                                SpaceHeight(),
                                ProductNameTextField(
                                  enable: true,
                                  name: nameController,
                                ),
                                PriceTextField(
                                  enable: true,
                                  price: priceController,
                                ),
                                WeightTextField(
                                  enable: true,
                                  weight: weightController,
                                ),
                                SpaceText(),
                                SizePacketText(),
                                SpaceText(),
                                SizePacketTextField(
                                  enable: true,
                                  width: widthController,
                                  height: heightController,
                                ),
                                SpaceText(),
                                IncressProductText(),
                                SpaceText(),
                                IncressProductTextField(
                                  num: numController,
                                ),
                                ProductionDateTextField(
                                    dateselect: () =>
                                        _selectDate(context),
                                    dateshow: selectDate == null
                                        ? DateFormat('yyyy-MM-dd')
                                            .format(DateTime.now())
                                        : DateFormat('yyyy-MM-dd ')
                                            .format(selectDate)),
                                PlaceTextField(
                                  storage: storageController,
                                ),
                                RecommendTextField(
                                  recommend: recommendController,
                                ),
                                NoteTextField(
                                  note: noteController,
                                ),
                                SaveBUTTON(
                                  save: () => UpdateProduct(
                                      widget.productDetail.ID,
                                      nameController.text,
                                      priceController.text,
                                      weightController.text,
                                      widthController.text,
                                      heightController.text,
                                      numController.text,
                                      selectDate == null
                                          ? DateFormat('yyyy-MM-dd HH:mm:ss')
                                              .format(DateTime.now())
                                          : DateFormat('yyyy-MM-dd HH:mm:ss')
                                              .format(selectDate),
                                      storageController.text,
                                      recommendController.text,
                                      noteController.text,
                                      snapshot.data == null ? widget.productDetail.UrlImage1:snapshot.data.path,
                                      context),
                                ),
                                DelectBUTTON(
                                  save: () => DelectProduct(
                                      context, widget.productDetail.ID),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
