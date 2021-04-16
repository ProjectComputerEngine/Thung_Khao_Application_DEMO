import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Admin/OrderDetail.dart';
import 'package:thung_khao_rbac/Configuration.dart';
import 'package:thung_khao_rbac/Connect/Module/Order.dart';
class PictureProfile extends StatelessWidget {
  final String url;
  const PictureProfile({
    Key key, this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration( shape:CircleBorder(),color:Colors.white),
      height: MediaQuery.of(context).size.height*0.125,
      width: MediaQuery.of(context).size.width*0.125,
      child: Image.network('https://d2pa5gi5n2e1an.cloudfront.net/th/images/article/10890_TH/1.jpg'),
    );
  }
}

class TextBillButton extends StatelessWidget {
  final Function SeleteStatus;
  final String TextInButtons;
  const TextBillButton({
    Key key, this.TextInButtons, this.SeleteStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.height*0.05,
        width: MediaQuery.of(context).size.width*0.275,
        color: Colors.white,
        child: FlatButton(
          onPressed: SeleteStatus,
          child: Text(TextInButtons,style: TextStyle(fontSize: Config.OrderMain_fontB),),
        ),
      ),
    );
  }
}


class NavigationButton extends StatelessWidget {
  final Icon BarIcon;
  final String BarText;

  const NavigationButton({
    Key key,
    this.BarIcon,
    this.BarText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(shape: CircleBorder()),
      child: FlatButton(
        onPressed: () => {},
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            BarIcon,
            Container(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              BarText,
              style: TextStyle(fontSize: Config.OrderMain_fontB),
            )
          ],
        ),
        minWidth: MediaQuery.of(context).size.width * 0,
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
        style: TextStyle(color: Colors.white,fontSize: Config.OrderMain_fontH),
      ),
    );
  }
}


class OrderItem extends StatelessWidget {
  final String UrlImage;
  final String IDOrder;
  final String NameOwner;
  final String Status;
  final String Date;
  final Order bill;
  const OrderItem({
    Key key,
    this.UrlImage,
    this.IDOrder,
    this.NameOwner,
    this.Status,
    this.Date, this.bill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      height: MediaQuery.of(context).size.height * 0.09,
      color: Colors.white60,
      child: FlatButton(
        onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>OrderDetail(bill: bill,id: bill.ID,))),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(UrlImage),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.3,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0,
                  0.01,
                  MediaQuery.of(context).size.width * 0,
                  0.01),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Order #${IDOrder}',
                      style: TextStyle(color: Colors.red,fontSize: Config.OrderDetail_fontB),
                    ),
                    Text(
                      NameOwner,
                      style: TextStyle(fontSize: Config.OrderMain_fontB, color: Colors.black),
                    ),
                    Text(Date,
                        style: TextStyle(fontSize: Config.OrderMain_fontB, color: Colors.black38))
                  ]),
            ),
            Container(
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width * 0.35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'สถานะ : ' + Status,
                    style: TextStyle(fontSize: Config.OrderMain_fontB, color: Colors.black38),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
