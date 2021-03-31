
import './Widget/LoginWidget.dart';
import 'package:flutter/material.dart';
import 'package:minimize_app/minimize_app.dart';

import './BackEnd/LoginBackend.dart';

class LoginMain extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginMain> {
  TextEditingController userController;

  TextEditingController passController;

  FocusNode userNode;
  FocusNode passNode;
  FocusNode loginNode;

  @override
  void initState() {
    // value of Textformfield
    userController = TextEditingController();
    passController = TextEditingController();
    // focus of node
    userNode = FocusNode();
    passNode = FocusNode();
    loginNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    print('Dispose Login Complete');
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () => MinimizeApp.minimizeApp(),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(32, 50, 50, 10),
        body: Container(
          margin: MediaQuery.of(context).padding,
          color: Color.fromRGBO(32, 50, 50, 10),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.05,
                0,
                MediaQuery.of(context).size.width * 0.05,
                0),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ImageLogo(),
                TextAccount(
                  IconCheng: Icons.account_circle,
                  controller: userController,
                  autofocus: true,
                  mynode: userNode,
                  obsure: false,
                  nextnode: passNode,
                ),
                Space(
                  EmtySpace: MediaQuery.of(context).size.height * 0.01,
                ),
                TextAccount(
                  IconCheng: Icons.lock,
                  controller: passController,
                  mynode: passNode,
                  obsure: true,
                  nextnode: loginNode,
                ),
                Space(
                  EmtySpace: MediaQuery.of(context).size.height * 0.01,
                ),
                ButtonAccessSystem(
                  mynode: loginNode,
                    Goto: () =>login(context,userController.text,passController.text),
                ),
                TextRegis(),
                Space(
                  EmtySpace: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
