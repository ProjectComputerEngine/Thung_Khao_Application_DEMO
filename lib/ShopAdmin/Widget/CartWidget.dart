import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Configuration.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Bill.dart';
class AcessToStatus extends StatelessWidget {
  final String TextStatusINButton;
  const AcessToStatus({
    Key key, this.TextStatusINButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0,0,MediaQuery.of(context).size.width*0,0),
        height: MediaQuery.of(context).size.height*0.05,
        width: MediaQuery.of(context).size.width*0.9,
        child: FlatButton(
          onPressed: ()=>{},
          child: Text(TextStatusINButton,style: TextStyle(fontSize: Config.OrderDetail_fontB),),
        ),


      ),
    );
  }
}

class StatusOnBILL extends StatelessWidget {
  const StatusOnBILL({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('รอดำเนินการ',style: TextStyle(fontSize: Config.OrderDetail_fontB,color: Colors.red),),
      alignment: Alignment.centerRight,
      width: MediaQuery.of(context).size.width*0.68,
    );
  }
}

class StatusOfBill extends StatelessWidget {
  final String TypeOfStatus;
  const StatusOfBill({
    Key key, this.TypeOfStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(TypeOfStatus,style: TextStyle(fontSize: Config.OrderDetail_fontB),),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width*0.2,
    );
  }
}

class TitleBox extends StatelessWidget {
  final String TextTitle;
  const TitleBox({
    Key key, this.TextTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(6, 243, 186, 10),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              topLeft: Radius.circular(8))),
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0,
          0,
          MediaQuery.of(context).size.width * 0,
          0),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Text(TextTitle,style: TextStyle(fontSize: Config.OrderDetail_fontHS),),
    );
  }
}

class DateAndTime extends StatelessWidget {
  final String DateANDTimeFont;

  const DateAndTime({
    Key key,
    this.DateANDTimeFont,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
          DateANDTimeFont,
          style: TextStyle(fontSize: Config.OrderDetail_fontB, color: Colors.black),
        ));
  }
}

class NameText extends StatelessWidget {
  const NameText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
          'ข้าวหอมมะลิ รสใบมะลิ สกัดพิเศษ',
          style: TextStyle(fontSize: Config.OrderDetail_fontBB, color: Colors.black),
        ));
  }
}

class MassageTitle extends StatelessWidget {
  const MassageTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'ตะกร้า',
        style: TextStyle(color: Colors.white,fontSize: Config.OrderDetail_fontH),
      ),
    );
  }
}
class BacksButton extends StatelessWidget {
  const BacksButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: FlatButton(
        minWidth: MediaQuery.of(context).size.width * 0,
        onPressed: () => {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}

    class ProductItem extends StatelessWidget {
  final Bill bill;
  const ProductItem({
    Key key, this.bill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double price = double.parse(bill.price);
    double num = double.parse(bill.num);
    double sum = price*num;
    return Card(
      child: Container(
        height:
        MediaQuery.of(context)
            .size
            .height *
            0.12,
        child: Row(
          children: [
            Card(
              shape: CircleBorder(),
              child: Container(
                child: Image.network(bill.imageURL),
                height: MediaQuery.of(
                    context)
                    .size
                    .height *
                    0.16,
                width: MediaQuery.of(
                    context)
                    .size
                    .width *
                    0.16,
              ),
            ),
            Container(
              width: MediaQuery.of(
                  context)
                  .size
                  .width *
                  0.48,
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment
                    .start,
                mainAxisAlignment:
                MainAxisAlignment
                    .center,
                children: [
                  NameText(),
                  DateAndTime(
                    DateANDTimeFont:
                    'ราคา ${bill.price}   จำนวน  ${bill.num} ถุง',
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment
                  .centerRight,
              child: Text(
                'ราคารวม \n ${sum.toString()} ',
                style: TextStyle(
                    color:
                    Colors.red,
                    fontSize: Config
                        .OrderDetail_fontB),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// ------------------     dialog        -----------------------
Future<void> showMyDialog(BuildContext context,String dialogMessage) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('ถุงข้าว'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(dialogMessage),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('ยืนยัน'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
// ------------------     dialog        -----------------------
Future<void> showMyDialogY(BuildContext context,String dialogMessage) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('ถุงข้าว'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(dialogMessage),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('ยืนยัน'),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>StorageMain()));
            },
          ),
        ],
      );
    },
  );
}

