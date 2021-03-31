import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Login.dart';
import 'package:provider/provider.dart';
import 'package:thung_khao_rbac/Login/Login.dart';

Future<void> logout(BuildContext context) async {
  await Provider.of<LoginConnection>(context,listen: false).logout();
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => LoginMain()));
}