import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Configuration.dart';
import '../Inbox.dart';
import '../OrderMain.dart';
import '../StorageMain.dart';
import '../AdminMain.dart';
import '../PersonalAdmin.dart';
class MenuNavigation extends StatelessWidget {
  final int page;
  const MenuNavigation({
    Key key, this.page,
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
            select: page==0|| page==4 ? true:null,
            BarIcon: Icon(Icons.book),
            BarText: 'คำสั่งซื้อ',
            goto: (){
              print('Go to Order Main Admin');
              page !=0? Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>OrderMain())):null;
            },
          ),
          NavigationButton(
            select: page==1|| page==5|| page==6 ? true:null,
            BarIcon: Icon(Icons.storage),
            goto: (){
              print('Go to Storage Main Admin');
              page!=1? Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>StorageMain())):null;
            },
            BarText: 'คลังสินค้า',
          ),
          // NavigationButton(
          //   BarIcon: Icon(Icons.home),
          //   BarText: 'หน้าหลัก',
          //   goto: (){
          //     print('Go to Admin Main');
          //     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>AdminMain()));
          //
          //   },
          // ),
          NavigationButton(

            BarIcon: Icon(Icons.chat),
            BarText: 'ข้อความ',
            goto: (){
               Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>InboxMain()));

              print('Go to Inbox');
            },
          ),
          NavigationButton(
            select: page==3 ? true:null,
            BarIcon: Icon(Icons.account_circle),
            goto: (){
              print('Go to Personal Admin Main');
              page!=3? Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>PersonalAdminMain())):null;

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
  final bool select;
  const NavigationButton({
    Key key,
    this.BarIcon,
    this.BarText, this.goto, this.select,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: select!=null? BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Colors.black))):BoxDecoration(),
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
