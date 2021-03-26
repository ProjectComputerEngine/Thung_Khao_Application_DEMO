import 'package:flutter/material.dart';
import '../Inbox.dart';
import '../OrderMain.dart';
import '../StorageMain.dart';
import '../AdminMain.dart';
import '../PersonalAdmin.dart';
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
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>OrderMain()));
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
            BarIcon: Icon(Icons.home),
            BarText: 'หน้าหลัก',
            goto: (){
              print('Go to Admin Main');
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>AdminMain()));

            },
          ), NavigationButton(
            BarIcon: Icon(Icons.chat),
            BarText: 'ข้อความ',
            goto: (){
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>InboxMain()));

              print('Go to Inbox');
            },
          ),
          NavigationButton(
            BarIcon: Icon(Icons.account_circle),
            goto: (){
              print('Go to Personal Admin Main');
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>PersonalAdminMain()));

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
