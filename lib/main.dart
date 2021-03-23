import 'package:flutter/material.dart';
import './Into/IntoMain.dart';
void main() {
  runApp(ThungKhao());
}



class ThungKhao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntoMain(),
    );
  }
}