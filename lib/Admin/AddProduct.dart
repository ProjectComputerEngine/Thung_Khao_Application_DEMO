import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Admin/StorageMain.dart';
import './Widget/AddProductWidget.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import './Backend/AddProductBackend.dart';
import 'Widget/BottonNavigationBarAdminWidget.dart';

class AddProductMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddProductState();
  }
}

class AddProductState extends State<AddProductMain> {
  final formKey = GlobalKey<FormState>();

  String imagePath;

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

  BehaviorSubject streamController;

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
  void initState() {
    streamController = BehaviorSubject();
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
    streamController.close();
    print('Dispose Add Product Complete');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => StorageMain())),
      child: Scaffold(
        bottomNavigationBar: MenuNavigation(),
        body: Container(
          margin: MediaQuery.of(context).padding,
          child: Column(
            children: [
              Container(
                color: Color.fromRGBO(32, 50, 50, 10),
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  children: [
                    BackButton(
                      color: Colors.white,
                    ),
                    AddProductText()
                  ],
                ),
              ),
              Form(
                key: formKey,
                child: Flexible(
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
                          child: StreamBuilder(
                        stream: streamController.stream,
                        builder: (context, snapshot) {
                          Widget contact;
                          Widget contacttwo;
                          if (snapshot.hasData) {
                            imagePath = snapshot.data.path;
                            contact = Image.file(
                              snapshot.data,
                              fit: BoxFit.cover,
                            );
                            contacttwo = Image.file(snapshot.data);
                          } else {
                            contact = Icon(
                              Icons.add_circle,
                              color: Colors.grey,
                            );
                            contacttwo = Container();
                          }
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              LargeImageBox(
                                content: contact,
                                file_picker: () =>
                                    ReadFildPath(streamController),
                              ),
                              SpaceWidth(),
                              TwoImageBox(
                                contact: contacttwo,
                              ),
                              SpaceWidth(),
                              TwoImageBox(
                                contact: contacttwo,
                              ),
                            ],
                          );
                        },
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
                              error: 'กรุณาใส่ชื่อสินค้า',
                              myNode: nameNode,
                              nextNode: priceNode,
                              name: nameController,
                            ),
                            PriceTextField(
                              enable: true,
                              error: 'กรุณาใส่ราคาสินค้า',
                              myNode: priceNode,
                              nextNode: weightNode,
                              price: priceController,
                            ),
                            WeightTextField(
                              enable: true,
                              error: 'กรุณาใส่น้ำหนักสินค้า',
                              myNode: weightNode,
                              nextNode: widthNode,
                              weight: weightController,
                            ),
                            SpaceText(),
                            SizePacketText(),
                            SpaceText(),
                            SizePacketTextField(
                              enable: true,
                              error: 'กรุณาใส่ขนาดของบรรจุ๓ัณฑ์',
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
                              enable: true,
                              error: 'กรุณาใส่จำนวนของสินค้า',
                              myNode: numNode,
                              nextNode: dateStartNode,
                              num: numController,
                            ),
                            ProductionDateTextField(
                                myNode: dateStartNode,
                                dateselect: () =>
                                    _selectDate(context, storageNode),
                                dateshow: selectDate == null
                                    ? DateFormat('yyyy-MM-dd ')
                                        .format(DateTime.now())
                                    : DateFormat('yyyy-MM-dd ')
                                        .format(selectDate)),
                            PlaceTextField(
                              error: 'กรุณาใส่สถานทีผลิตของสินค้า',
                              myNode: storageNode,
                              nextNode: recommendNode,
                              storage: storageController,
                            ),
                            RecommendTextField(
                              error: 'กรุณาใส่คำเเนะนำของสินค้า',
                              myNode: recommendNode,
                              nextNode: noteNode,
                              recommend: recommendController,
                            ),
                            NoteTextField(
                              error: 'กรุณาใส่หมายเหตุของสินค้า',
                              myNode: noteNode,
                              nextNode: saveNode,
                              note: noteController,
                            ),
                            SaveBUTTON(
                              myNode: saveNode,
                              save: () => UploadProduct(
                                  nameController.text,
                                  priceController.text,
                                  weightController.text,
                                  widthController.text,
                                  heightController.text,
                                  numController.text,
                                  selectDate == null
                                      ? DateFormat('yyyy-MM-dd')
                                      .format(DateTime.now())
                                      : DateFormat('yyyy-MM-dd ')
                                      .format(selectDate),
                                  storageController.text,
                                  recommendController.text,
                                  noteController.text,
                                  imagePath,
                                  context),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
