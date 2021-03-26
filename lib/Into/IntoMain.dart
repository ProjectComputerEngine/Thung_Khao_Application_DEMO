import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Product.dart';
import '../Admin/AdminMain.dart';
import '../Login/Login.dart';
import '../ShopAdmin/ShopMain.dart';

import 'package:provider/provider.dart';
class IntoMain extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<IntoMain> {

  @override
  initState() {
    timerLinkPage(context,LoginMain() );
    super.initState();
  }

  @override
  void dispose() {
    print('Dispose Main Into Complete');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white12,
        body: Center(
          child: Container(
            child: Image.asset('res/logo.png'),
          ),
        ));
  }
}

Future timerLinkPage(BuildContext context, Widget main) {
  return Future.delayed(Duration(seconds: 3), () {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => main));
  });
}
