
import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Admin/UpdatePresonalAdmin.dart';
import 'package:thung_khao_rbac/Admin/Widget/BottonNavigationBarAdminWidget.dart';
import 'package:thung_khao_rbac/Login/Login.dart';
import './Widget/PersonalAdminWidget.dart';
import 'AdminMain.dart';
class PersonalAdminMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PersonalState();
  }
}

class PersonalState extends State<PersonalAdminMain> {

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    print('Dispose Personal Admin ');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>AdminMain())),
      child: Scaffold(
        bottomNavigationBar: MenuNavigation(),
        body: Container(
          margin: MediaQuery.of(context).padding,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('res/Background.png'), fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.01,
                    0,
                    MediaQuery.of(context).size.width * 0.01,
                    0),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,

                child: Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      children: [
                        BackButton(
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Container(height: MediaQuery.of(context).size.height * 0.08),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('res/logo.png'),
                      )),
                  TextName(
                    SelfNameText: '',
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  TextUnderName(
                    FrontText: ('ตำแหน่ง'),
                    EndText: '',
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextUnderName(
                    FrontText: ('เบอร์โทร'),
                    EndText:'',
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  ClickButton(
                    TextButton: ('แก้ไขโปรไฟล์'),
                    event: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalAdminUpdate())),
                  ),
                  ClickButton(
                    TextButton: ('ออกจากระบบ'),
                    event: ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginMain())),
                  ),

                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}