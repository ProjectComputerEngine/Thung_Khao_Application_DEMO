import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Configuration.dart';
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
      child: Text('รอดำเนินการ',style: TextStyle(fontSize: Config.OrderDetail_fontH,color: Colors.red),),
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
          style: TextStyle(fontSize: Config.OrderDetail_fontSB, color: Colors.black),
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
