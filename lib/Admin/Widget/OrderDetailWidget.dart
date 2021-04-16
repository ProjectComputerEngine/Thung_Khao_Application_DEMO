import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Admin/OrderMain.dart';
import 'package:thung_khao_rbac/Configuration.dart';
import 'package:thung_khao_rbac/Connect/Module/OrderDetail.dart';

class AcessToStatus extends StatelessWidget {
  final String TextStatusINButton;
  final Function update ;
  const AcessToStatus({
    Key key,
    // ignore: non_constant_identifier_names
    this.TextStatusINButton, this.update,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0, 0,
            MediaQuery.of(context).size.width * 0, 0),
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.9,
        child: FlatButton(
          onPressed: update,
          child: Text(
            TextStatusINButton,
            style: TextStyle(fontSize: Config.OrderDetail_fontB),
          ),
        ),
      ),
    );
  }
}

class StatusOnBILL extends StatelessWidget {
  final String status;

  const StatusOnBILL({
    Key key,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        status,
        style: TextStyle(fontSize: Config.OrderDetail_fontB, color: Colors.red),
      ),
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width * 0.68,
    );
  }
}

class StatusOfBill extends StatelessWidget {
  final String TypeOfStatus;

  const StatusOfBill({
    Key key,
    this.TypeOfStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        TypeOfStatus,
        style: TextStyle(fontSize: Config.OrderDetail_fontB),
      ),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.2,
    );
  }
}

class TitleBox extends StatelessWidget {
  final String TextTitle;

  const TitleBox({
    Key key,
    this.TextTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(6, 243, 186, 10),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(8))),
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0, 0,
          MediaQuery.of(context).size.width * 0, 0),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Text(TextTitle),
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
          style:
          TextStyle(fontSize: Config.OrderDetail_fontSB, color: Colors.black),
        ));
  }
}

class NameText extends StatelessWidget {
  final String name;

  const NameText({
    Key key,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
          name,
          style: TextStyle(fontSize: Config.OrderDetail_fontB, color: Colors.black),
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
        'คำสั่งซื้อ',
        style:
        TextStyle(color: Colors.white, fontSize: Config.OrderDetail_fontH),
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
  final DetailOrder bill;

  const ProductItem({
    Key key,
    this.bill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double price = double.parse(bill.Price);
    double num = double.parse(bill.Num);
    double sum = price * num;
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        child: Row(
          children: [
            Card(
              shape: CircleBorder(),
              child: Container(
                child: Image.network(bill.UrlImage),
                height: MediaQuery.of(context).size.height * 0.16,
                width: MediaQuery.of(context).size.width * 0.16,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.48,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NameText(name: bill.Name),
                  DateAndTime(
                    DateANDTimeFont:
                    'ราคา ${bill.Price}   จำนวน  ${bill.Num} ถุง',
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                'ราคารวม \n ${sum.toString()} ',
                style: TextStyle(
                    color: Colors.red, fontSize: Config.OrderDetail_fontB),
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
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>OrderMain()));
            },
          ),
        ],
      );
    },
  );
}
