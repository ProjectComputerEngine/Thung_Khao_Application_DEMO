import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Configuration.dart';
import 'package:thung_khao_rbac/ShopAdmin/Chat.dart';
import '../../ShopAdmin/StorageMain.dart';
import '../OrderHistory.dart';
import '../../ShopAdmin/Cart.dart';
import '../ShopMain.dart';
class MenuNavigation extends StatelessWidget {
  const MenuNavigation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavigationButton(
            BarIcon: Icon(Icons.book),
            BarText: 'คำสั่งซื้อ',
            goto: (){
              print('Go to Order Main Admin');
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>OrderHistory()));
            },
          ),

          NavigationButton(
            BarIcon: Icon(Icons.shopping_cart_rounded),
            BarText: 'ตะกร้า',
            goto: (){
              print('Go to Admin Main');
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Cart()));

            },
          ),
          NavigationButton(
            BarIcon: Icon(Icons.storage),
            goto: (){
              print('Go to Storage Main Admin');
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>StorageMain()));
            },
            BarText: 'คลังสินค้า',
          ),
          NavigationButton(
            BarIcon: Icon(Icons.chat),
            BarText: 'ข้อความ',
            goto: (){
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>ChatBoxMain()));

              print('Go to Inbox');
            },
          ),
          NavigationButton(
            BarIcon: Icon(Icons.account_circle),
            goto: (){
              print('Go to Personal Shop Main');
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>ShopMain()));

            },
            BarText: 'ข้อมูลส่วนตัว',
          ),

        ],
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final Icon BarIcon;
  final String BarText;
  final Function goto;

  const NavigationButton({
    Key key,
    this.BarIcon,
    this.BarText, this.goto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(shape: CircleBorder()),
      child: FlatButton(
        onPressed: goto,
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
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        minWidth: MediaQuery.of(context).size.width * 0,
      ),
    );
  }
}
