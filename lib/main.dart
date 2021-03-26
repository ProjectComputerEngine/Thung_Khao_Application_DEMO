import 'package:flutter/material.dart';
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
        Provider<ProductConnection>(create:(_)=> ProductConnection())
      ],
      child: MaterialApp(
        home: IntoMain(),
      )
    );
  }
}