import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Login.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Order.dart';
import './Into/IntoMain.dart';
import 'package:provider/provider.dart';
import './Connect/BackEnd/Product.dart';
void main() {
  runApp(ThungKhao());
}



class ThungKhao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProductConnection>(create:(_)=> ProductConnection()),
        Provider<LoginConnection>(create: (_)=>LoginConnection()),
        Provider<OrderConnection>(create: (_)=>OrderConnection())
      ],
      child: MaterialApp(
        home: IntoMain(),
      )
    );
  }
}